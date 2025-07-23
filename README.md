# 🎉 **Word-X Game** 🧩

[![Play Word-X on Appetize.io](https://img.shields.io/badge/Preview-Appetize.io-%233E87FF?style=for-the-badge&logo=flutter)](https://appetize.io/app/b_fansmotcgcirtcm3xxmqnvm7vi)

**Welcome to *Word-X*!** 🌟 A super fun word puzzle game built with **Flutter** to flex my skills in *GetX state management*, *GetStorage persistence*, *Just Audio sound effects* 🎵, and *smooth animations* ✨. Guess words, vibe with cool feedback, and conquer **50 levels** of brain-teasing fun! Ready to dive in? 🚀

---

## 📋 **Table of Contents**

- [🌟 Features](#-features)
- [🛠️ Technologies Used](#-technologies-used)
- [🎮 Gameplay](#-gameplay)
- [📥 Installation](#-installation)
- [📂 Project Structure](#-project-structure)
- [🔥 Key Implementations](#-key-implementations)
  - [GetX State Management](#getx-state-management-)
  - [GetStorage Persistence](#getstorage-persistence-)
  - [Just Audio Sounds](#just-audio-sounds-)
  - [Animations & Visuals](#animations--visuals-)
  - [Level Generation](#level-generation-)
- [🤝 How to Contribute](#-how-to-contribute)
- [📜 License](#-license)

---

## 🌟 **Features**

Get ready for an *addictive* word-guessing adventure! 😄 Here's what makes **Word-X** awesome:

- **50 Epic Levels** 🏆: Progress through 50 unique levels with words and hints, served up in order for a smooth journey.
- **Interactive Keyboard** ⌨️: A 12-letter keyboard with shuffled letters (word letters + random extras, duplicates included for fun) refreshes every level!
- **Vivid Visual Feedback** 🎨:
  - Correct guesses glow in **blue** (`#3E87FF`) 🌌.
  - Wrong guesses flash a **red border** (3px) for 500ms, then revert to blue 🔴➡️🔵.
  - Empty boxes rock a transparent look with a sleek blue border.
- **Trial-Based Challenge** ⏳: Limited attempts per level, saved persistently, with snappy feedback when you run out.
- **Audio Vibes** 🎶: Hear *taps*, *wins*, and *oops* moments with **Just Audio** sound effects.
- **Smooth Animations** ✨: Letters slide in, borders pulse, and levels transition with flair.
- **Save Your Progress** 💾: Keep your level, trials, and points safe with **GetStorage**.
- **Playful Font** 🖌️: Styled with the quirky *Comic-Helvetic* font for a fun vibe.
- **Responsive Design** 📱: Looks great on any screen, with a dynamic keyboard grid.

---

## 🛠️ **Technologies Used**

Built with love using these awesome tools: 💖

- **Flutter** 🚀: Cross-platform magic for slick UI and game logic.
- **GetX** ⚡: Lightweight state management, navigation, and dependency injection.
- **GetStorage** 💾: Persistent storage for saving your game progress.
- **Just Audio** 🎵: Crisp sound effects for an immersive experience.
- **Dart** 🐦: The heart of Flutter development.

---

## 🎮 **Gameplay**

**Word-X** is all about guessing words and having a blast! 😎 Here's how it works:

1. **Goal**: Guess the correct word for each level using a virtual keyboard.
2. **Levels**: Tackle **50 levels**, each with a unique word and hint, drawn sequentially from `wordHintPairs` 📜.
3. **Keyboard**:
   - Shows **12 letters** (word letters + random extras, duplicates allowed for easier play).
   - Shuffled every level for a fresh challenge 🔄.
4. **Input**:
   - Tap letters to fill boxes (e.g., 4 letters for a 4-letter word) ✍️.
   - Delete letters with a backspace action.
   - Full guess? It submits after a **500ms delay** ⏲️.
5. **Feedback**:
   - **Correct**: Blue filled boxes, +10 points, and on to the next level! 🎉
   - **Incorrect**: Red border for 500ms, input clears, and a "Try again!" snackbar 😅.
   - **Out of Trials**: "No trials left!" message with a nudge to buy more ⛔.
6. **Progress**: Level, trials, and points are saved so you never lose your spot 💪.
7. **Audio**: Hear *clicks* for taps, *cheers* for wins, and *buzzes* for mistakes 🎧.
8. **Animations**: Letters pop in, borders flash, and levels transition smoothly 🌈.

---

## 📥 **Installation**

Get **Word-X** running on your machine in a snap! 🚀

1. **Clone the Repo**:
   ```bash
   git clone https://github.com/goodnewsjames/WordX.git
   cd word-x-game