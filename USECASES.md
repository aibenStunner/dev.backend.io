# Backend MVP Specification

## User Categories:

-   Administrators
-   Standard Users

## Standard User Data

```json
{
    "auth":{
        "username",
        "password-hash",
        "session-id",
        "role":"user"

    },
    "organization":{
        "school-id"
        "group-id"
    }
}
```

-   If session-id is active, user is logged in automatically.

-   Else, user logs in with username and password.

-   User belongs to an organization referenced by 'school-id'.

-   Within the organization, user belongs to a collective referenced by 'group-id'.

-   An organization may have many collectives ('group-id').

-   User can only access feeds available to his 'group-id'.

## Administrator Data

```json
{   "auth":
    {
        "username",
        "password-hash",
        "session-id",
        "role":"admin"
    },
    "organization":{
        "school-id"
    }
}
```

-   Auth features are same as standard user. Backend determines role role

## Client App:

```
## POST Endpoints
backend/login   token || username && password
backend/feed   feed-id && token
backend/logout token
```

1. User logs in, if credentials check out, backend begins session set to expire in 12 hours.

2. User has access to only a specified set of camera endpoints. This is contained in the database.

3. User may view live feed from a single camera at a time.
