
# General Instructions

- project is now connected to the localhost server. tar api reference chya section madhe Instructions ahet te bghun adhi server install kara
- jevha pan project chalu karal tevha server on kara ani sadhya project web vrch check kara.
- Tejas normal goshti zalyvr server deploy karun taak taki mobile vr app test karta yeil aplyla. karan mobile madhech apan dakhavnar presentation

```
├───lib
│   ├───client
│   ├───components
│   ├───models
│   ├───provider
│   ├───router
│   ├───screens
│   │   └───trial pages
│   ├───services
│   │   └───apiServices
│   ├───sprovider_pages
│   │   └───sprov_trial

```

- **components:** clientNavigation madhe client drawer ani navigation drawer madhe provider cha navigation
- **router:** router madhe routes dile ahet
- **screens trials:** jar konte navin pages add karayche astil tar ikde karayche
- **services apiServices:** ikde me don functions banavle ahet api call sathi.
    - callapiparse: jevha fkt json asel
    - callapiparselist: jevha jsonlist asel

- **client:** all client related pages are here
- **sprovider_pages:**:all (lawyers) provider related pages are here


## Tasks Sections
[Client Side](#client-side)

[General Tasks](#general-tasks)

[First Screen](#first-screen)

[login screen](#login-screen)

[Provider Side](#provider-side)

[API Reference](#api-reference)

### General Tasks

>Samarth
- add animations
- decide one color schema
- UI changes at all places necessary

## First Screen
>Samarth & Ajit
- firstscreen.dart
- logo and lets begin page
- change logo(png) all images uptill login buttons.
## login screen
>Samarth & Ajit

- donhi login and signup che UI changes
- change screen i.e. client login and provider login should look different
### Client Side

> Samarth, Ajit & Tejas
> on click request chi info sathi clientviewrequest(case_id) ha implementation dila ahe -1
- Explore page
    - change asset images (S & A)
    - when lawyer etc. is clicked it should display the lawyers, notary  (T)

- Schedule Page (S & A)
    - change design
    - make it so that there can be events and all.

- Manage Request Page
    - Created Request Page
        - mostly completed ahe use for reference
        - +button click kelyvr new form banavnyasathi page along with UI (S & A)
        - new form post kelyvr data save (T)
- Applied Request Page
    - jya pan provider la apply karnar te ikde disnar.(T)
    - provider name & request_title. he tiles madhe disle pahije (T)
    - view request connection mara -1 (T & S)
    - view profile ne lawyer chi profile disli pahije. data fetch cha code ahe sprovider_pages->profiles->sprov_profile madhe. tyacha UI var laksh dya (S & A)

- Accepted Request
    - je request lawyers ne accept kele ahet te disle pahije (list) (T)
    - on click (clientviewrequest) (T)


## Provider Side
> Samarth (ALL SCREENS UI)
>Dashboard
- Connection & Network Screen
    - lawyer la jevde friend req ale ahet te disle (T)
    - ani sarve accounts netwok madhe display (T)

- Request Wali Screen
    - jyanni lawyer la request pathvli ahet te ikde dislayla have (list) (T)
    - applied request kadun taka

- Jobs Screen
    - No change just make UI better (S & A)

> Schedule page
- just like calendar page in client but for Provider (S & A)

> Case
- list ->call information when clicked (T)
- mark as done on clicked should be removed from existing and moved in solved casess (T)
## API Reference

https://github.com/MechanicalNoob05/coco-backend

ithe server ahe clone kelyvr npm-i kar mostly aplylar nusta get karaycha ahe tr direct browser vr check kara kiva thunderclient install kara.

> server start on cmd
```
node index.js
```
jikde :id asa ahe tikde id token takaycha
#### user

```http
  GET http://localhost:3000/user/
```

| Parameter | Description                |
| :-------- | :------------------------- |
| `/` | Getting all Regular User |
| `/signup` | Adding New User |
| `/:userId` | Getting User by ID |

#### Provider

```http
  GET http://localhost:3000/member/
```

| Parameter | Description                |
| :-------- | :------------------------- |
| `/` | Getting all legal User |
| `/signup` | Adding New legal User |
| `/:userId` | Getting Legal User by ID |

#### case

```http
  GET http://localhost:3000/case/
```

| Parameter | Description                |
| :-------- | :------------------------- |
| `/` | Getting all cases |
| `/add-case` | Adding New case |
| `/:caseId` | Getting case  by ID |
| `/user-cases/:userId` | Getting all cases of one regular user |