# Case-Study1-Report-Group-OOTD_Apps
Case Study 1 Report for OOTD Mobile Application - INFO 4335
## Group Member Details 
| No.| Names                     | Matric No. |
|----|:-------------:            | :---------------:|
| 1 | AMEER AL-WAFIQ BIN NORAZAM | 2119005 |
| 2 | MUHAMMAD HAFIZ BIN ADLAN   | 2114989 |
| 3 | MAZIN MUHAMMED ANES        | 2116025 |

## Table of Contents
| No. | Sub| Content       | Person in Charge |
|-----|:--:|:-------------:|:----------:|
| 1 | - | Project Initiation  | Ameer | 
| 2 | - | Requirement Analysis| - |
| - | 2(i) | Technical Feasibility & Back-End Assessments | Ameer, Hafiz |
| - | 2(ii) | Compability of the application with the chosen platform | Ameer, Mazin |
| - | 2(iii) | Sequence Diagram | Mazin |
| - | 2(iv) | Screen Navigation Flow | Hafiz |
| - | 2(v) | Gantt Chart | Ameer |
| - | 2(vi) | References | All |


## 1. Project Initiation
### a) Title 
- The title for our proposed mobile application is 'OOTD'.

### b) Background of the problem
- Clothing is essential to daily life, reflecting our culture, environment, and identity. Beyond providing comfort and protection, clothes also serves as a form of self-expression and symbolizes roles, traditions, or status. Either way, human's are very close to their wearings than other things because that is what they will be thinking first before do any other tasks.

- As fashion evolves, the rising demand for clothing highlights concerns about sustainability and ethical values. With Americans now buying an average of 53 new items per year — four times as much as in 2000 — the fashion industry increasingly reflects not just personal identity but also broader environmental challenges. The more challenging problem is that, people are buying clothes that are not crucial for them and most of the time they have it already at home, some of them are not even weared once. Furthermore, tons of clothes are ending up as a waste making buying new clothes nowadays is not really sustainable and environmentally friendly. (Textiles: Material-Specific Data | US EPA, 2024)

- By having a platform where people can keep track their clothes seamlessly and knowing which items are rarely used, they could lessen their temptation to buy new clothes and increase the usage of their catalogs of clothes in a daily basis.

### c) Purpose
- The three main purpose for our application that reflects the problems arise in the global community:
  1. To reduce temptation of people to buy new clothes and promote sustainable practice by using owned clothes more often rather than buying new ones.
  2. To help people ease their clothes management and act as ardrobe organiser.
  3. To further help user keep track of their individual clothes and other accessories.

### d) Target User
- There are several specific target users for our applications;
  1. Fashion Designer : The app is suitable for fashion designer to promote their fashions and try new outfits.
  2. Corporate Adults : Adults that need to plan out outfits before their meetings with others can surely use this to organise their outfits to better match their surroundings.
  3. Social Media Influencers : They will use the application to maxiise their outfit usage especially if they are doing thrifting content or second-hand outfit market, this app can be useful to help the create more combination of clothes.
- Other target users will be the general population ranging from 18 to 60 years old that using Android smartphones that seeks to a more sustainable environment and organised wardrobe.

### e) Preferred Platform
- The preferred platform for the 'OOTD' application is Android. There are several reasons as to why Android is being chosen as the application's platform;
1. Android boasts a significant share of the global mobile operating system market, making it an ideal platform for a developing application to penetrate the market and compete with similar apps. (Source: Mobile Operating System Market Share Worldwide | StatCounter Global Stats. n.d., StatCounter Global Stats. Retrieved from https://gs.statcounter.com/os-market-share/mobile/worldwide)
2. Furthermore, Android offers one of the largest and most active communities for application development. This vibrant ecosystem provides developers with access to numerous resources, including tips, step-by-step walkthroughs, and troubleshooting guides, which streamline the development process and simplify debugging. (Source: Developer. 2017, October 21. Why is Android Application Development So Popular? Medium. Retrieved from https://medium.com/@developer45/why-is-android-application-development-so-popular-18159d2d94c6)
3. Android also haing various price points for their smartphone platofrms, making them a lot ore cost-effectie compared to other platforms.

### f) Features & Functionalities
#### 1. Outfit Saving and Cataloging
- This main feature will allow users to snap and upload photos of their outfits/individual clothing items and to organise those into categories e.g. tops, bottoms, shoes, accessories, etc.
#### 2. Clothing Matching Assistance
- Provide mix-and-match feature to help users create new outfit combinations by randomising each categories. Users chosen outfit will be recorded and stored in database for analytics.
#### 3. Wardrobe Insights Dashboard
- SHow basic analytics such as; most frequently worn items, least used tops/bottoms/shoes/accessories, total tops/bottoms/shoes/accessories, and also 'Favorites', which user can decide to use and recorded by the application. 

## 2. Requirement Analysis
### i. Technical Feasibility & Back-End Assessments
#### Data Storage for CRUD Operations, Packages, Plugins
- Based on the features of our application, the data that will be stored in our back-end will comprises of several data:
1. Images of stored clothing items
2. User's username and password
3. List of clothing categories
4. Analytics data
5. Outfit combination history data

- The database that we will be using is the Firebase service. Firstly, this is because Firebase is very easy to setup and more simpler. Also, since it is free at first as the Firebase uses pay-as-you-go model, we could limit the user of the application if the database started to reach the maximum free storage (Firebase pricing. (n.d.). Firebase. https://firebase.google.com/pricing). The main considerations for the cost to storing the data in database are:
1. The image storage - as this is the data that will use lots of space
2. Database operations for analytics and outfit tracking
3. Server computing resources
4. API calls

- Secondly, we also uses Firebase as it has the official Flutter SDK that will ease the developent process. Also, with the Firebase housing the Flutter SDK, the packages and plugins that are offered in Flutter (pub.dev) can be easily obtained and used. These are the list of packages and plugins that we are planning to use:
1. ``` image_picker ``` - A Flutter plugin for taking new pictures with the camera.
2. ```cloud_firestore``` - A Flutter plugin for Cloud Firestore, a cloud-hosted, noSQL database with live synchronization and offline support on Android.
3. ```firebase_storage``` - A Flutter plugin for Firebase Cloud Storage, a powerful, simple, and cost-effective object storage service for Android.
4. ```flutter_cache_manager``` - Generic cache manager for Flutter.
5. ```fl_chart``` - A highly customizable Flutter chart library that supports Line Chart, Bar Chart, Pie Chart, Scatter Chart, and Radar Chart.

- In conclusion, we concluded that using Firebase is feasible due to the platform's ease of setup, cost-effective pay-as-you-go model, compatibility with Flutter through its official SDK, and the availability of a wide range of packages and plugins that streamline the development process.


### ii. Compability of the application with the chosen platform (smartphone)
- The minimum SDK version of Android that we decide to use is the Android 8.0 which has API Level 26 or higher. The decision is collectively chosen due to the fact that most of the modern version of Android phones is running on Android 8.0 Oreo that was released to public since 2017.
- Furthermore, according to Adnroid, if we deelop the application targeting Android 8.0, it will still continue working on Android 13 and future versions, with implementation of several features recommended by Android (Source : https://developer.android.com/guide/practices/compatibility).
- Also, the Android 8.0 supports Camera2 API, that was introduced in Android 5.0. This allows for a more quality photo.
- Lastly, instead of checking each of the devices Android version, Android also recommend feature-checking on their specific feature inside the smartphone, whether their hardwares are usable or not.

### iii. Sequence Diagram
![Sequence](https://github.com/user-attachments/assets/8b3364cd-94f6-4925-a853-970da5cb36c5)

### iv. Screen Navigation Flow (Logical Design)
![App FLow Diagram-1](https://github.com/user-attachments/assets/3955fa67-c6ce-49f7-94bf-559dbe88cbc2)


### v. Gantt Chart
![ganttchart_ootd](https://github.com/user-attachments/assets/e7247e38-e944-4c62-9c99-fc069a58d27a)

### vi. References 
- Horvath, K. (2024, May 10). How many clothes are too many? PIRG. https://pirg.org/articles/how-many-clothes-are-too-many/
- Coren, M. J. (2023, December 14). Why you should buy clothes to last (almost) forever. Washington Post. https://www.washingtonpost.com/climate-environment/2023/11/07/long-lasting-clothes-fast-fashion/
- Textiles: Material-Specific Data | US EPA. (2024, November 8). US EPA. https://www.epa.gov/facts-and-figures-about-materials-waste-and-recycling/textiles-material-specific-data
- Maiti, R. (2024, May 30). Fast fashion and its environmental impact in 2024 | Earth.Org. Earth.Org. https://earth.org/fast-fashions-detrimental-effect-on-the-environment/
- Burke, C. (2022, May 24). Fashion industry people share how often they buy new clothes. Fashion Journal. https://fashionjournal.com.au/fashion/fashion-industry-people-new-clothes/
- Cladwell. (2013). Personal wardrobe assistant. Cladwell. https://cladwell.com/
- Storey. (2021). A wardrobe app that simplifies getting dressed. Storey. https://www.storeytheapp.com/
- GetWardrobe - outfit maker and closet organizer. (n.d.). https://getwardrobe.com/
- Combyne. (n.d.). https://www.combyne.com/
- Binsaeed, S. (2021, December 10). A Virtual wardrobe — my first UX/UI project - Sara Binsaeed - medium. Medium. https://medium.com/@sarabinsaeed/a-virtual-closet-uxdi-project-1-c3dfeaafe70c
- Rule, D. (2024, May 1). The best Wardrobe apps 2024: Compared & Ranked | Indyx. Indyx. https://www.myindyx.com/blog/the-best-wardrobe-apps
- OpenAI. (2024). ChatGPT (Dec 24 version) [Large language model]. https://chatgpt.com/share/67699a19-b588-8009-a793-2995909f1651
- Anthropic. (2024). Claude (Dec 24 version) [Large language model]. https://claude.ai/chat/1ac5e550-0bd5-4be9-b4f9-efa91e9a8f6a
