import os
import json
import math

from config import SCORING_FOLDER, APP_DATA_FOLDER, OUTPUT_FILE, DATA_DIR, APP_DATA_FILE


class DataProcessor:
    """
    A class to process the data from the given scoring data and application data.
    """

    def __init__(self, base_path: str):
        """
        Initialize the DataProcessor.

        Args:
            base_path (str): The path to the directory containing the data folders.
        """
        self.base_path = base_path

    @staticmethod
    def compute_pd(score: float) -> float:
        """
        Compute the probability of default (pd) from the given score.

        Args:
            score (float): The given score value.

        Returns:
            float: The computed pd.
        """
        return 1 / (1 + math.exp(-score))

    @staticmethod
    def extract_important_emotions(app_data: dict) -> list[str]:
        """
        Extract the important emotions with confidence >= 20%.

        Args:
            app_data (dict): The application data containing the emotions.

        Returns:
            list[str]: A list of important emotions.
        """
        emotions = app_data['aws_selfie_recognition_data']['faces']['face_details'][0]['emotions']
        return [emotion['type'] for emotion in emotions if emotion['confidence'] >= 20]

    def process_data(self, scoring_data: dict, app_data: dict) -> dict:
        """
        Process the data from the given scoring data and application data.

        Args:
            scoring_data (dict): The scoring data.
            app_data (dict): The application data.

        Returns:
            dict: Processed data.
        """
        output_data = {
            'id': app_data.get('id'),
            'type': app_data.get('type'),
            'salary': app_data.get('salary'),
            'score': scoring_data.get('score'),
            'pd': self.compute_pd(scoring_data.get('score')),
            'result': int(scoring_data.get('result')),
            'Result_adj': 1 if self.compute_pd(scoring_data.get('score')) < 0.5 and app_data.get('salary') >= 20000 else 0,
            'max_loan_amount': scoring_data.get('max_loan_amount', 0),
            'Important_emotions': self.extract_important_emotions(app_data)
        }
        return output_data

    def process_folder(self, folder_path: str) -> dict | None:
        """
        Process the data inside a specific folder.

        Args:
            folder_path (str): The path to the folder to be processed.

        Returns:
            dict | None: Processed data or None if there's no data to process.
        """
        scoring_folder = os.path.join(folder_path, SCORING_FOLDER)
        app_data_path = os.path.join(folder_path, APP_DATA_FOLDER, APP_DATA_FILE)

        if not os.path.exists(scoring_folder) or not os.path.exists(app_data_path):
            return None

        scoring_files = [f for f in os.listdir(scoring_folder) if f.startswith('scoring-') and f.endswith('.json')]

        if not scoring_files:
            return None

        scoring_file_path = os.path.join(scoring_folder, scoring_files[0])

        with open(scoring_file_path, 'r') as scoring_file:
            scoring_data = json.load(scoring_file)

        with open(app_data_path, 'r') as web_app_data_file:
            app_data = json.load(web_app_data_file)

        return self.process_data(scoring_data, app_data)

    def run(self) -> None:
        """Run the processing for all folders in the base path."""
        for folder in os.listdir(self.base_path):
            folder_path = os.path.join(self.base_path, folder)

            if not os.path.isdir(folder_path):
                continue

            result = self.process_folder(folder_path)

            if not result:
                continue

            with open(os.path.join(folder_path, OUTPUT_FILE), 'w') as f:
                json.dump(result, f, indent=4)


if __name__ == "__main__":
    processor = DataProcessor(DATA_DIR)
    processor.run()
