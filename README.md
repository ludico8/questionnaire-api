# Questionnaire Api Project 

This is an API-only project, that let you perform CRUD operations through its end-points. The models supported by this project are Questions, Answers, and Users with the following structure:

<img width="841" alt="Screen Shot 2020-05-27 at 16 51 12" src="https://user-images.githubusercontent.com/3277761/83080091-a0877280-a03a-11ea-8134-3f231917da77.png">

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites
- Linux distribution
- Postgresql
- Ruby on Rails

### Installing
- Install postgresql: `sudo apt-get install postgresql libpq-dev`
- Create DB and a new User:
```  
psql
CREATE DATABASE questionnaire_development;
use questionnaire_development
CREATE USER writerboy with encrypted password 'doubleclick';
GRANT ALL PRIVILEGES ON DATABASE "questionnaire_development" to writerboy;

psql
CREATE DATABASE questionnaire_test;
use questionnaire_test
CREATE USER writerboy_test with encrypted password 'doubleclick_test';
GRANT ALL PRIVILEGES ON DATABASE "questionnaire_test" to writerboy_test;
\q
exit
```

### Commands to run
- bundle install
- rake db:migrate
- rake db:seed
- rails s

Now the APIS are available!, just open your browser and use one of the following:

#### POST CREATE QUESTION
```
  [POST] http://localhost:3000/api/v1/questions
  Params:
    label(string)
    active(integer)
```

#### POST CREATE ANSWER
```
  [POST] http://localhost:3000/api/v1/answers
  Params:
    user_id(integer)
    question_id(integer)
    answer(string)
```

#### GET RETRIEVE DATA
```
  [GET] http://localhost:3000/api/v1/search_answers
  Params:
    user_id (integers separeted by commas)
    user_name (string)
    user_email (string)
    question_id (integers separeted by commas)
    question_label (string)
    active_question (true|false string)
    answer (string)
   
  Response Structure:
    {
      "status": "SUCCESS",
      "messages": "Answers",
      "data": [
        {
          "id": 1,
          "name" "User Name",
          "email": "User Email".
          "questions": [     #only the questions answered by the user
             {
                "id": 7434,
                "label": "Question Label",
                "active": true,
                "answer": {
                    "id": 581,
                    "answer": "User's answer"
                }
             },
             ...
          ]
        },
        ...
      ]
    }
    
```

## Deployment
This project has been deployed in heroku, so ask for the administrator for the credentials and the proper commands to deploy this project to Heroku.

Since this project has been already deployed to Heroku, you're able to access the endpoints using the following domain: https://questionnaire-api-project.herokuapp.com

- [GET] https://questionnaire-api-project.herokuapp.com/api/v1/search_answers
<br />Optional Params:<br />
`user_id` (integers separeted by commas)<br />
`user_name` (string)<br />
`user_email` (string)<br />
`question_id` (integers separeted by commas)<br />
`question_label` (string)<br />
`active_question` (true|false string)<br />
`answer` (string)<br />

- [POST] https://questionnaire-api-project.herokuapp.com/api/v1/questions
<br />Params:<br />
`label` (string)<br />
`active` (integer)<br />

- [POST] https://questionnaire-api-project.herokuapp.com/api/v1/answers
<br />Params:<br />
`user_id` (integer)<br />
 `question_id` (integer)<br />
  `answer` (string)<br />


Additional Apis:
- [GET] https://questionnaire-api-project.herokuapp.com/api/v1/answers
- [GET] https://questionnaire-api-project.herokuapp.com/api/v1/answers/:id
- [GET] https://questionnaire-api-project.herokuapp.com/api/v1/questions
- [GET] https://questionnaire-api-project.herokuapp.com/api/v1/questions/:id
- CRUD actions for each model included.

## Authors

* **Diego Corrales** - [Questionnaire API](https://github.com/ludico8/questionnaire-api) - [@ludico8](https://www.linkedin.com/in/ludico8/)

## License

This project is licensed under the MIT License.

