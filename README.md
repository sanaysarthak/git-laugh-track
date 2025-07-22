<a id="readme-top"></a>

<br />
  <h1 align="center">Git Hook - Sitcom Laugh Track! 😂</h1>

<p align="center">
   Bring laughter to your commits with <strong><em>Git Laugh Track</em></strong>.
</p>

<p align="center">
  A Git hook that plays a sitcom laugh track every time you commit code.
</p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#overview">Overview</a>
    </li>
    <li>
      <a href="#demo">Demo</a>
    </li>
    <li>
      <a href="#run-locally">Run Locally</a>
    </li>
    <li>
      <a href="#how-to-use">How to Use</a>
    </li>
    <li>
      <a href="#tools-used">Tools Used</a>
    </li>
  </ol>
</details>



<!--OVERVIEW --> 
<a id="overview"></a>
## Overview :-

Git Laugh Track is a fun and lightweight tool that adds a sitcom laugh track to your Git workflow. Every time you make a commit, a random laugh track sound will play, bringing a bit of humor and joy to your development process.

Key features include:
- Plays a random sitcom laugh track on every Git commit.
- Easy to install and uninstall.
- Works with most popular audio players (`paplay`, `mpg123`, `afplay`).
- No dependencies beyond standard Unix tools and an audio player.
- Easily customizable: Add your own MP3 files to personalize the laugh track experience.



<!--DEMO -->
<a id="demo"></a>
## Demo (Enable Sound 🔊) :-
https://github.com/user-attachments/assets/27a704b9-01be-40ed-ae80-489633212f4e



<!--SETUP -->
<a id="run-locally"></a>
## Run Locally :-

#### Installation
1. Clone or download this repository to your local machine.
  ```sh
  git clone https://github.com/sanaysarthak/git-laugh-track.git
  ```
2. Navigate to the project directory.
  ```sh
   cd git-laugh-track
  ```
3. Run the global installer to enable the laugh track for all new repositories:
  ```sh
  bash global-install.sh
  ```



<!-- HOW TO USE -->
<a id="how-to-use"></a>
## How to Use :-

#### Step 1: Make a Commit
Use Git as you normally would. After each commit, a random laugh track will play:
```sh
git commit -m "commit message"
```

#### Step 2: Enjoy the Laugh Track
If your system has a compatible audio player, you'll hear a sitcom laugh track after each commit.

#### Step 3: Uninstall (Optional)
To remove the laugh track hook and all related files from your system:
```sh
bash uninstall.sh
```



<!--TOOLS-USED -->
<a id="tools-used"></a>
## Tools Used :-

This project uses the following tools and scripts:

- Bash scripts (`global-install.sh`, `uninstall.sh`) for setup and removal.
- Git hooks (`post-commit`) for triggering the laugh track.
- Standard Unix utilities (`find`, `shuf`, etc.).
- Audio players: `paplay`, `mpg123`, or `afplay` (one required).
