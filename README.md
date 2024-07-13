# MT Gallery App (Flutter Assessment Task)

![Logo or Banner Image](https://github.com/user-attachments/assets/f60275ea-2fa8-4aa4-bd74-2c0b587188f8)

## Table of Contents

1. [Introduction](#introduction)
2. [Features](#features)
3. [In-App Screenshots](#in-app-screenshots)
4. [Demo Video](#demo-video)
5. [Installation](#installation)
6. [APK Download](#apk-download)
7. [Feedback](#feedback)

## Introduction

An Assessment Task for the Flutter Developer (L-1) role at Manush Technologies Ltd.

## Features

- See List of Albums
- Search any album by the album title
- See List of Photos
- Search any photos by the photo title
- added pagination for both album and photo lists
- Preview and Zoom in/out any specific photo
- Refresh lists by pull-down gesture
- Switch between Grid-View & List-View of both album and photo list
- While previewing photos, swipe left/right to view previous/next photo

## In-App Screenshots

<table>
  <tr>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/ffb354e8-fa9e-4425-af3d-c57573b4c45e" width="270" height="570" alt="Splash Screen"/><br>
      <i>Splash Screen</i>
    </td>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/5e5b7aae-1fee-4b79-84d7-10d387ef8a76" width="270" height="570" alt="Album Listview"/><br>
      <i>Album Listview</i>
    </td>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/53ecb977-b542-4eb0-b6a4-df96a816c3e6" width="270" height="570" alt="Album Gridview"/><br>
      <i>Album Gridview</i>
    </td>
  </tr>
  <tr>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/0fd717ca-c62e-4f7a-9a41-ac15685fbb22" width="270" height="570" alt="Search Album Listview"/><br>
      <i>Search Album Listview</i>
    </td>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/17a970b8-e279-42a2-a80c-769060eb466d" width="270" height="570" alt="Search Album Gridview"/><br>
      <i>Search Album Gridview</i>
    </td>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/6a6fbb33-8135-46e3-bb61-092e00f62dcd" width="270" height="570" alt="No Result on Album Search"/><br>
      <i>No Result on Album Search</i>
    </td>
  </tr>
  <tr>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/0cbc7689-c489-4dec-a44a-b53442db27e2" width="270" height="570" alt="Photo Listview"/><br>
      <i>Photo Listview</i>
    </td>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/356b5ca1-ac50-49e0-a34a-bece2d14672d" width="270" height="570" alt="Photo Gridview"/><br>
      <i>Photo Gridview</i>
    </td>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/0f142462-3401-40be-a2a0-a0996ea6557f" width="270" height="570" alt="Search Photo Listview"/><br>
      <i>Search Photo Listview</i>
    </td>
  </tr>
  <tr>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/7cc94a35-750d-4da7-a4e8-7322f74b97c3" width="270" height="570" alt="Search Photo Gridview"/><br>
      <i>Search Photo Gridview</i>
    </td>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/94d862a5-f9a9-490c-b990-9eff07f8ddbb" width="270" height="570" alt="No Result on Photo Search"/><br>
      <i>No Result on Photo Search</i>
    </td>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/06eabb5f-ba97-405e-9eab-c1d0ac16bc88" width="270" height="570" alt="Photo Preview"/><br>
      <i>Photo Preview</i>
    </td>
  </tr>
  <tr>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/c8c186f3-58b7-44c2-bea9-d3145377102a" width="270" height="570" alt="Photo Preview (Zoom In)"/><br>
      <i>Photo Preview (Zoom In)</i>
    </td>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/b487659d-ab68-471e-b9e7-3470894aca8b" width="270" height="570" alt="Photo Preview (Zoom Out)"/><br>
      <i>Photo Preview (Zoom Out)</i>
    </td>
  </tr>
</table>

## Demo Video

[![Watch the video](https://github.com/user-attachments/assets/ffb354e8-fa9e-4425-af3d-c57573b4c45e)](https://github.com/user-attachments/assets/b89c5e2e-109a-45b3-b6ec-d452a77b6733)

## Installation

### Prerequisites

- [Flutter SDK](https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.22.2-stable.zip)
- [Dart SDK](https://storage.googleapis.com/dart-archive/channels/stable/release/3.4.4/sdk/dartsdk-windows-x64-release.zip)
- [Android Studio](https://developer.android.com/studio)

### Steps

1. Clone the repository
   ```bash
   git clone https://github.com/SabirKhanAkash/mt_flutter_task.git
2. Go to the project directory
   ```bash
   cd mt_flutter_task
3. Open the project in Android Studio
4. Run an Android Emulator
5. Install the necessary dependencies by running these commands in the terminal from the project
   directory
   ```bash
   flutter clean
   flutter pub get
   flutter run --release
6. Test and Explore the App in Emulator
7. To Generate the APK, run these commands in the terminal from the project directory
   ```bash
   flutter clean
   flutter pub get
   flutter build apk --release

## APK Download

Download the APK file
from [here](https://drive.google.com/drive/folders/16AI3EH0M2jq754kDBO1KzBdEA2YXbiIb?usp=sharing)

## Feedback

If you discover any bugs or any kind of feedback then create
issues [here](https://github.com/SabirKhanAkash/mt_flutter_task/issues/new) & star the repo if you
like the project
