# Ultrablog
[Link to Ultrablog!](http://tasks1.enjoymyweb.com)

## Introduction

#### The task tracker part enables several following features:

* Register an account, update account information
* Log in / Log out
* Create Tasks, entering a title, a description and an assignee
* Assign tasks to themselves or other users based on their registered email address
* Track my assigned tasks, track all tasks I send out, track all tasks in the pool
* Track how long assignee's worked on the task they're assigned to, in 15-minute increments
* Edit Tasks, entering a new title, a new description, or assign to a new person
* Mark a task as completed or incompleted
* Delete user account and delete task info

More advanced part of Ultrablog coming soon!

## Design choices need to be aware of

1. Every email is unique, no two accounts can have same email address
2. The maximal time an assignee can show their work time is 150 minutes, time beyond that cannot be selected
3. Use assignee's email address to identify who to be assigned a task
4. Only Assignee or Issuer of a task can have a show link to see the detail description of a task
5. Only Assignee of a task can have a solve it link to solve a task
6. Only Issuer of a task can have an edit link and a delete button to edit or delete an existing task
7. Only users click the show button can they see a task's detail description

For point 1, it make sense in real world because one email is only used by one person. One person can have many emails but one email can only be owned by one person.

For point 2, only 150 minutes is because when a task cannot be finished within 2.5 hours, it may need another 3 hours or one day, which we can just use the **Done** or **Not Done** signal to track that task

For point 3, use email address to identify a user makes sense

For point 4, all other unrelated users cannot see the detail of a task makes sense
