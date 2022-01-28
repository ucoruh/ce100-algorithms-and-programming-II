---
marp: true
theme: default
style: |
    img[alt~="center"] {
      display: block;
      margin: 0 auto;
    }
_class: lead
paginate: true
backgroundColor: #fff
backgroundImage: url('https://marp.app/assets/hero-background.svg')
header: 'CE100 Algorithms and Programming II'
footer: '![height:50px](http://erdogan.edu.tr/Images/Uploads/MyContents/L_379-20170718142719217230.jpg) RTEU CE100 Week-6'
title: "CE100 Algorithms and Programming II"
author: "Author: Asst. Prof. Dr. Uğur CORUH"
date:
subtitle: "Matrix Chain Order / LCS"
geometry: "left=2.54cm,right=2.54cm,top=1.91cm,bottom=1.91cm"
titlepage: true
titlepage-color: "FFFFFF"
titlepage-text-color: "000000"
titlepage-rule-color: "CCCCCC"
titlepage-rule-height: 4
logo: "assets/2021-10-19-15-01-36-image.png"
logo-width: 100 
page-background:
page-background-opacity:
links-as-notes: true
lot: true
lof: true
listings-disable-line-numbers: true
listings-no-page-break: false
disable-header-and-footer: false
header-left:
header-center:
header-right:
footer-left: "© Dr. Uğur CORUH"
footer-center: "License: WTFPL"
footer-right:
subparagraph: true
lang: en-US 

math: katex
---

<!-- _backgroundColor: aquq -->

<!-- _color: orange -->

<!-- paginate: false -->

## CE100 Algorithms and Programming II

## Week-6 (Matrix Chain Order / LCS)

#### Spring Semester, 2021-2022

Download [DOC](ce100-week-6-lcs.md_doc.pdf), [SLIDE](ce100-week-6-lcs.md_slide.pdf), [PPTX](ce100-week-6-lcs.md_slide.pptx)

<iframe width=700, height=500 frameBorder=0 src="../ce100-week-6-lcs.md_slide.html"></iframe>

---

<!-- paginate: true -->

## Matrix Chain Order / Longest Common Subsequence

## Outline

- Elements of Dynamic Programming 
  - Optimal Substructure 
  - Overlapping Subproblems 

---

- Recursive Matrix Chain Order Memoization 
  - Top-Down Approach 
  - RMC 
  - MemoizedMatrixChain 
    - LookupC 
  - Dynamic Programming vs Memoization Summary 

---

- Dynamic Programming 
  - Problem-2 : Longest Common Subsequence 
    - Definitions 
    - LCS Problem 
    - Notations 
    - Optimal Substructure of LCS 
      - Proof Case-1 
      - Proof Case-2 
      - Proof Case-3 
    
    ---
    
    
    
    - A recursive solution to subproblems (inefficient) 
    - Computing the length of and LCS 
      - LCS Data Structure for DP 
      - Bottom-Up Computation 
    - Constructing and LCS 
      - PRINT-LCS 
      - Back-pointer space optimization for LCS length 

---

- Most Common Dynamic Programming Interview Questions 
  - Problem-1:  Longest Increasing Subsequence 
    - https://www.geeksforgeeks.org/longest-increasing-subsequence-dp-3/ 
    - https://en.wikipedia.org/wiki/Longest_increasing_subsequence#:~:text=In%20computer%20science%2C%20the%20longest,not%20necessarily%20contiguous%2C%20or%20unique. 
    - https://www.youtube.com/watch?v=22s1xxRvy28&ab_channel=StableSort 

---

  - Problem-2: Edit Distance 
    - https://www.geeksforgeeks.org/edit-distance-dp-5/ 
    - https://www.youtube.com/watch?v=tU2f2JwHmfQ&feature=youtu.be&ab_channel=PrepForTech 
    - Recursive 
      - https://www.youtube.com/watch?v=8Q2IEIY2pDU&ab_channel=BenLangmead 
    - DP 
      - https://www.youtube.com/watch?v=0KzWq118UNI&ab_channel=BenLangmead 
      - https://www.youtube.com/watch?v=eAVGRWSryGo&ab_channel=BenLangmead 

---

  - Problem-3: Partition a set into two subsets such that the difference of subset sums is minimum 
    - https://www.geeksforgeeks.org/partition-a-set-into-two-subsets-such-that-the-difference-of-subset-sums-is-minimum/ 
  - Problem-4: Count number of ways to cover a distance 
    - https://www.geeksforgeeks.org/count-number-of-ways-to-cover-a-distance/ 
  - Problem-5: Find the longest path in a matrix with given constraints 
    - https://www.geeksforgeeks.org/find-the-longest-path-in-a-matrix-with-given-constraints/ 

---

  - Problem-6: Subset Sum Problem 
    - https://www.geeksforgeeks.org/subset-sum-problem-dp-25/ 
  - Problem-7: Optimal Strategy for a Game 
    - https://www.geeksforgeeks.org/optimal-strategy-for-a-game-dp-31/ 
  - Problem-8: 0-1 Knapsack Problem 
    - https://www.geeksforgeeks.org/0-1-knapsack-problem-dp-10/ 

---

  - Problem-9: Boolean Parenthesization Problem 
    - https://www.geeksforgeeks.org/boolean-parenthesization-problem-dp-37/ 
  - Problem-10: Shortest Common Supersequence 
    - https://www.geeksforgeeks.org/shortest-common-supersequence/ 
    - https://en.wikipedia.org/wiki/Shortest_common_supersequence_problem 
  - Problem-11: Partition Problem 
    - https://www.geeksforgeeks.org/partition-problem-dp-18/ 
  - Problem-12: Cutting a Rod 
    - https://www.geeksforgeeks.org/cutting-a-rod-dp-13/ 

---

  - Problem-13: Coin Change 
    - https://www.geeksforgeeks.org/coin-change-dp-7/ 
  - Problem-14: Word Break Problem 
    - https://www.geeksforgeeks.org/word-break-problem-dp-32/ 
  - Problem-15: Maximum Product Cutting 
    - https://www.geeksforgeeks.org/maximum-product-cutting-dp-36/ 

---

  - Problem-16: Dice Throw 
    - https://www.geeksforgeeks.org/dice-throw-dp-30/ 
  - Problem-17: Box Stacking Problem 
    - https://www.geeksforgeeks.org/box-stacking-problem-dp-22/ 
  - Problem-18: Egg Dropping Puzzle 
    - https://www.geeksforgeeks.org/egg-dropping-puzzle-dp-11/ 

---

## References

TODO
