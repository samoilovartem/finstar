
# How to build development and testing process to minimize a chance of breakage?

Here are the things I currently use or find useful to have in a project. Please take note though that I'm not familiar with Finstar internal processes, so this might be considered as a general best practice:

### Version Control System (VCS):

This allows tracking changes, reverting to previous versions, and collaborating with multiple developers without overwriting each other's changes.

### Development Environments:

**Local Environment:** Every developer should have their local setup to write and test code before it gets to any shared or staging environment.

**Development/Staging Environment:** Before deploying to production, everything is tested in an environment that closely mirrors production.

### Feature Branching:

Branching strategy such as "feature branching" or "GitFlow". New features or bug fixes should be developed in separate branches, not directly on the main or master branch.

### Code Review Process:

A peer review process for all code changes. Platforms like GitHub or GitLab offer Pull Requests (or Merge Requests) functionalities that facilitate this.
This process allows a second set of eyes to catch issues, ensure coding standards, and share knowledge.

### Automated Testing:

**Unit Testing:** Testing individual units of code (like functions or methods) to ensure they work as intended (unittest, pytest).

**Integration Testing:** Testing the interactions between integrated components or systems.
End-to-End (E2E) Testing: Test the flow of an application as a user would experience it. Tools like Selenium or Cypress are popular for E2E tests.

### Continuous Integration (CI):

CI tools like Jenkins (if ever someone still use it), Travis CI, or GitHub Actions.
CI ensures that code changes are automatically tested against the test suite whenever they are pushed to the repository, providing quick feedback to developers.

### Continuous Deployment/Delivery (CD):

Automation of the deployment process to ensure consistent and rapid delivery of changes to staging or production.


### Monitor and Log:

Implementation of logging and monitoring solutions (e.g., ELK Stack, Sentry, and so on) to detect, alert, and diagnose issues in real-time.

### Documentation:

Documentation of system architecture, setup procedures, and any changes. This is essential for onboarding new team members and ensuring consistent practices.

### Training and Knowledge Sharing:

Regularly team trainings on best practices, new tools, and technologies. Hold regular knowledge-sharing sessions.

### Rollback Strategy:

Always having a plan to revert changes. Whether it's reverting a Git commit, rolling back a database migration, or switching back to a previous system state, ensure you can undo changes if something goes wrong.
