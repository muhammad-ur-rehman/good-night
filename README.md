# Good Night APIS

Task is to build a Good night apis where we can clock in and clock out without authentication.

## Steps to Run the project Locally

To run this project, you will need to add the following libraries to your system

`ruby: 3.0.0`

`rails: 7.0.5`

### Installing Dependencies
once you have them on your machine and you are in project folder, run `bundle install` and all of the project dependencies will be installed.


#### Database creation

Create make sure you have postgresql installed and provide details of database in file(if needed):

```bash
database.yml
```


After that you can create a database and run seed files by

```bash
  rails db:create
  rails db:migrate
```
once all done you just need to run the project by starting the server

```bash
  rails s
```

## API Endpoints 

Here is the information about the API endpoints. The endpoints are part of the `/api/v1` namespace and can be accessed through the following URLs:

## Create a User

- **Endpoint:** POST `/api/v1/users`
- **Description:** This endpoint allows you to create a new user.
- **Headers:**
  | Key    | Value                                           |
  |--------|-------------------------------------------------|
  | Content-Type  |  application/json          |
- **Request Body:** 
```
{
  "user": {
    "name": "Muhammad"
  }
}
```

### Example cURL Request

```bash
curl --location 'http://localhost:3000/api/v1/users' \
--header 'Content-Type: application/json' \
--data '{
  "user": {
    "name": "Muhammad"
  }
}'
```

### Response

- **Status:** 201 OK
- **Body:** 
```json
{
    "id": 5,
    "name": "Muhammad",
    "sleep_records": []
}
```

---

## Show a User

- **Endpoint:** GET `/api/v1/users/:id`
- **Description:** Get user information .
- **Headers:**
  | Key           | Value                            |
  |---------------|----------------------------------|
  | Content-Type  | application/json                 |
  
- **Request Body:** None

### Example cURL Request

```bash
curl --location --request GET 'http://localhost:3000/api/v1/users/5' \
--header 'Content-Type: application/json' \
--data '{
  "user": {
    "name": "Muhammad"
  }
}'
```

### Response

- **Status:** 200 OK
- **Body:** 

``` JSON
{
    "id": 5,
    "name": "Muhammad",
    "sleep_records": []
}
```

## Get Sleeping Records of a user

- **Endpoint:** POST `/api/v1/users/:id/sleep_records`
- **Description:** Get all Sleep Records of a user.
- **Headers:**
  | Key    | Value                                           |
  |--------|-------------------------------------------------|
  | Content-Type  |  application/json          |
- **Request Body:** None

### Example cURL Request

```bash
curl --location 'http://localhost:3000/api/v1/users/5/sleep_records'
```

### Response

- **Status:** 201 OK
- **Body:** 
```json
[
    {
        "id": 6,
        "clock_in": "2023-07-04T12:06:07.293Z",
        "clock_out": null,
        "created_at": "2023-07-04T12:06:07.307Z",
        "user": {
            "id": 5,
            "name": "Muhammad"
        }
    }
]
```

---

## Clock in a user

- **Endpoint:** POST `/api/v1/users/:id/clock_in`
- **Description:** Clock in user .
- **Headers:**
  | Key           | Value                            |
  |---------------|----------------------------------|
  | Content-Type  | application/json                 |
  
- **Request Body:** None

### Example cURL Request

```bash

curl --location --request POST 'http://localhost:3000/api/v1/users/5/clock_in'

```

### Response

- **Status:** 200 OK
- **Body:** 

``` JSON
{
    "id": 7,
    "clock_in": "2023-07-04T12:09:06.817Z",
    "clock_out": null,
    "created_at": "2023-07-04T12:09:06.818Z",
    "user": {
        "id": 5,
        "name": "Muhammad"
    }
}
```


---

## Clock out a user

- **Endpoint:** POST `/api/v1/users/:id/clock_out`
- **Description:** Clock in user .
- **Headers:**
  | Key           | Value                            |
  |---------------|----------------------------------|
  | Content-Type  | application/json                 |
  
- **Request Body:** None

### Example cURL Request

```bash

curl --location --request POST 'http://localhost:3000/api/v1/users/5/clock_out'


```

### Response

- **Status:** 200 OK
- **Body:** 

``` JSON
{
    "id": 7,
    "clock_in": "2023-07-04T12:09:06.817Z",
    "clock_out": "2023-07-04T12:11:18.979Z",
    "created_at": "2023-07-04T12:09:06.818Z",
    "user": {
        "id": 5,
        "name": "Muhammad"
    }
}
```






## Create a Follower

- **Endpoint:** POST `/api/v1/users/:id/friendships`
- **Description:** This endpoint allows you to create a new user.
- **Headers:**
  | Key    | Value                                           |
  |--------|-------------------------------------------------|
  | Content-Type  |  application/json          |
- **Request Body:** 
```
{
  "followed_id": 1
}
```

### Example cURL Request

```bash
curl --location 'http://localhost:3000/api/v1/users/1/friendships' \
--header 'Content-Type: application/json' \
--data '{
  "followed_id": 1
}'
```

### Response

- **Status:** 201 OK
- **Body:** 
```json
{
    "id": 1,
    "name": "John Doe",
    "sleep_records": [
        {
            "id": 1,
            "clock_in": "2023-07-04T05:34:22.287Z",
            "clock_out": "2023-07-04T05:34:29.701Z",
            "created_at": "2023-07-04T05:34:22.302Z"
        }
    ]
}
```




## Delete a Follower

- **Endpoint:** Delete `/api/v1/users/:id/friendships`
- **Description:** This endpoint allows you to create a new user.
- **Headers:**
  | Key    | Value                                           |
  |--------|-------------------------------------------------|
  | Content-Type  |  application/json          |
- **Request Body:** 
```
{
  "followed_id": 1
}
```

### Example cURL Request

```bash
curl --location 'http://localhost:3000/api/v1/users/1/friendships' \
--header 'Content-Type: application/json' \
--data '{
  "followed_id": 1
}'
```

### Response

- **Status:** 204 No Content
- **Body:**  NONE



---

## Show a User Followers sleep records

- **Endpoint:** GET `/api/v1//users/:user_id/following_sleep_records`
- **Description:** Get user information .
- **Headers:**
  | Key           | Value                            |
  |---------------|----------------------------------|
  | Content-Type  | application/json                 |
  
- **Request Body:** None

### Example cURL Request

```bash
curl --location 'http://localhost:3000/api/v1/users/2/following_sleep_records'
```

### Response

- **Status:** 200 OK
- **Body:** 

``` JSON
[
    {
        "id": 11,
        "clock_in": "2023-07-04T12:20:05.883Z",
        "clock_out": null,
        "created_at": "2023-07-04T12:20:05.884Z",
        "user": {
            "id": 1,
            "name": "John Doe"
        }
    },
    {
        "id": 10,
        "clock_in": "2023-07-04T12:20:04.943Z",
        "clock_out": null,
        "created_at": "2023-07-04T12:20:04.943Z",
        "user": {
            "id": 1,
            "name": "John Doe"
        }
    },
    {
        "id": 1,
        "clock_in": "2023-07-04T05:34:22.287Z",
        "clock_out": "2023-07-04T05:34:29.701Z",
        "created_at": "2023-07-04T05:34:22.302Z",
        "user": {
            "id": 1,
            "name": "John Doe"
        }
    }
]
```
## Author

- [github:@muhammad-ur-rehman](https://github.com/muhammad-ur-rehman)

- [linkedin:@m-ur-rehman](https://www.linkedin.com/in/m-ur-rehman/)
