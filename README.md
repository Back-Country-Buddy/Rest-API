# README

# Back Country Buddy - RestAPI

### About this Api

This API allows the user to query endpoints to create, update, retrieve and destroy information related to Users, Tours, and Plans.

## Versions

- Ruby 2.5.3

- Rails 5.2.4.3

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]


<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
        <li><a href="#schema">Schema</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Application

Endpoints and example queries are listed below.

After logging in with AuthO all request must include Auth token in the header parameter authorization.

Users:

Example JSON response for the User resource:
```
{
    "data": {
        "id": "5",
        "type": "user",
        "attributes": {
            "user_name": "sampleuser",
            "email_address": "fake@gmail.comw",
            "emergency_contact_name": "My Momma",
            "emergency_number": "911"
        }
    }
}
```
- Create a user
  This endpoint can be used to create a user. The following attributes should be passed as query parameters. 
  user_name, email_address, emergency_contact_name, emergency_number
```
POST /api/private/v1/user/
```

- Get one user
```
GET /api/private/v1/user/#{email_address}
```

- Update a user
  This endpoint can be used to update any of the user attributes. Attributes should be entered as query parameters
```
PATCH /api/private/v1/user/#{id}
```
- Delete a user
  This endpoint can be used to delete a user. The user is found by ID.
```
PATCH /api/private/v1/user/#{id}
```

Tours:


### Built With

* [Ruby on Rails](https://rubyonrails.org/)
* [RSpec](https://github.com/rspec/rspec-rails)
* [JSONAPI](https://github.com/jsonapi-serializer/jsonapi-serializer)



See the [open issues](https://github.com/Back-Country-Buddy/Rest-API/issues) for a list of proposed features (and known issues).


<!-- GETTING STARTED -->
## Getting Started

### Installation

2. Fork and Clone the repo
   ```
   git clone [https://github.com/Back-Country-Buddy/Rest-API/]
   ```
3. Install gems
     -- For list of Gems see [here](https://github.com/Back-Country-Buddy/Rest-API/blob/main/Gemfile)
   ```
   bundle install
   ```
4. Setup the database: 
   
   ```
   Run rake db:{drop,create,migrate,seed} 
   ```

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Project Link: [https://github.com/Back-Country-Buddy/Rest-API/](https://github.com/Back-Country-Buddy/Rest-API)



<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [Img Shields](https://shields.io)
* [MIT Open Source License](https://opensource.org/licenses/MIT)
* [GitHub Pages](https://pages.github.com)






<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Back-Country-Buddy/Rest-API.svg?style=for-the-badge
[contributors-url]: https://github.com/Back-Country-Buddy/Rest-API/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Back-Country-Buddy/Rest-API.svg?style=for-the-badge
[forks-url]: https://github.com/Back-Country-Buddy/Rest-API/network/members
[stars-shield]: https://img.shields.io/github/stars/Back-Country-Buddy/Rest-API.svg?style=for-the-badge
[stars-url]: https://github.com/Back-Country-Buddy/Rest-API/stargazers
[issues-shield]: https://img.shields.io/github/issues/Back-Country-Buddy/Rest-API.svg?style=for-the-badge
[issues-url]: https://github.com/Back-Country-Buddy/Rest-API/issues
[product-screenshot]: images/screenshot.png

