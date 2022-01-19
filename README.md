# final-project1

* I was working on another repo but due to the huge size of files i neeeded to start this one.
* The sounds were removed due to the large file size and the inability to upload it to the time hop, but it is in the demo .

[The old repo url:][https://github.com/AhmedAsiri80/My-Project]


# This is Athkarapp- iOS App





 # Describe:

        Remembrance application is an application that displays prayer times, current time, date, audios for the reciters of the Noble Qur’an, as well as live broadcasts to YouTube channels, alerts and reminders, zakat calculation, as well as electronic praise .

The application supports Light / Dark mode
The application supports English / Arabic





 # User stories:

 * As a user, I want to see the current time and date so that I can see the time and date.

 * As a user, I would like to see prayer times so that I can know the prayer times.

 * As a user, I would like to know the location of the Grand Mosque and the Prophet's Mosque. I will be able to find out by entering on the map.

 * As a user, I want to read the daily supplications so that I can read.

 * As a user, I want to use the electronic rosary so that I can reach a certain number and not forget the number.

 * As a user, I want to calculate the amount of zakat so that I can know the amount of my zakat.

 * As a user, I would like to know information about Zakat so that I can browse the Google pages to find out more.

 * As a user, I want to read the Qur’an, I will be able to read and browse the entire Holy Qur’an.

 * As a user, I want to hear audios with Quran sounds so that I can hear the voice of a certain Sheikh.

 * As a user, I want to watch a live broadcast on YouTube on the channels of the Sunnah or the Noble Qur’an. I will be able to watch and listen to it

 * As a user, I want to know the names of God, choose a specific name and search for it and its meaning, you will be able to search for its meaning

 * As a user, I want to share one of the beautiful names of God, I will be able to share it with others by clicking on the share.

 * As a user, I want to add one of the names of God to the favourites. I will be able to add it to the favourites by clicking on the favourites or the star.

 * As a user, I want to add notes or alerts for any day or month of Ramadan. I will be able to add it, and I will also receive a notification and alert.

 * As a user, I want to know the platforms to donate, which are Saudi government platforms, and I will be able to enter and donate through the link and also identify them through the attached video clip .
 
 



# Client / Frontend

| User Path         | Component             | User Behavior                                                                          |                       
| ------------------| --------------------- | ---------------------------------------------------------------------------------------|
|  page main        | register page         |   the   user can register a new                                                        |                      
|  page main        | Login Page            | log in to login to your profile                                                        |                      
|  page main        |  the Holy Quran page  | the user can read the entire Holy Quran                                                |                       
|  page main        | Daily Athkar          |      entering the pages of Athkar                                                      |                      
|  page main        | time Prayer           |   live time , date and prayer times                                                    |
|  page main        | Al Qiblah             | Qiblah direction                                                                       |                       
|  page main        | Quranic audios        | choose the audios and chooose Sheikh                                                   |                       
|  page main        |   Youtube live        |  Access to live broadcast channels, the Quran and the Sunnah of the Prophet            |
|  page Daily Athkar|   Athkar sleep        | read the sleep Athkar                                                                  |
|  page Daily Athkar| Athkar after pray     |   read the after pray  Athkar                                                          |         
|  page Daily Athkar|   Athkar morning      | read the morning Athkar                                                                |
|  page Daily Athkar|   Athkar evening      | read the evening Athkar                                                                |
|  page Daily Athkar| the Holy Quran page   | the user can read the entire Holy Quran                                                |
|  more             |   Athzkat             | calculating the amount of zakat                                                        |
|  more             |   Names of Allah      |  Entering Names of Allah page and the ability to search                                |
|  Names of Allah   |   Names of Allah      |  Access to the meaning and the place to share to others and add to favorites           |




# Services
### User path
* Auth Service
    * auth.login(user)
    * auth.signup(user)
    * auth.logout()
    * auth.me()
    * auth.getUser() // synchronous
* Exit Point Service
    * exitPoint.list()
    * exitPoint.detail(id)
    * exitPoint.add(id)
    * exitPoint.delete(id)
* User Service
    * user.detail(id)


# Models (Server / Backend)

### User path
{
  id: {type: String, required: true, unique: true},\
  name: {type: String, required: true, unique: true},\
  image: {type: String, required: true, unique: false},\
  userEmail: {type: String, required: true, unique: true},\
  status: {type: String, required: true, unique: false},\
  latitude: {type: String, required: true, unique: false},\
  longitude: {type: String, required: true, unique: false},\
}


# Links

# Git
[Github Home Page Link](https://github.com/AhmedAsiri80)

[Project Repository Link](https://github.com/AhmedAsiri80/final-project1)

# Slides
[Slides Link](https://docs.google.com/presentation/d/15CS-3zjIpWC0eX_A99c9UK7IhoJtJUSkEZkxjQZEiXA/edit?usp=sharing)



