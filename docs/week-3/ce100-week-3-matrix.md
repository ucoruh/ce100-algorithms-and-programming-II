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
footer: '![height:50px](http://erdogan.edu.tr/Images/Uploads/MyContents/L_379-20170718142719217230.jpg) RTEU CE100 Week-3'
title: "CE100 Algorithms and Programming II"
author: "Author: Asst. Prof. Dr. Uğur CORUH"
date:
subtitle: "RAM / Matrix Multiplication"
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

## Week-3 (Matrix Multiplication/ Quick Sort)

#### Spring Semester, 2021-2022

Download [DOC](ce100-week-3-matrix.md_doc.pdf), [SLIDE](ce100-week-3-matrix.md_slide.pdf), [PPTX](ce100-week-3-matrix.md_slide.pptx)

<iframe width=700, height=500 frameBorder=0 src="../ce100-week-3-matrix.md_slide.html"></iframe>

---

<!-- paginate: true -->

## Solving Recurrences

## Outline


- Matrix Multiplication 
 
  - Traditional 
  
  - Recursive 
  
  - Strassen

---
## Outline

- Quicksort 

  - Hoare Partitioning 

  - Lomuto Partitioning 

  - Recursive Sorting 

---
## Outline

- Quicksort Analysis 

  - Randomized Quicksort 

  - Randomized Selection 

    - Recursive 

    - Medians 

---
## Matrix Multiplication

- **Input:** $A=[a_{ij}],B=[b_{ij}]$
- **Output:** $C=[c_{ij}]=A \cdot B$ $\Longrightarrow i,j=1,2,3, \dots, n$

$$
\begin{bmatrix}
    c_{11} & c_{12} & \dots & c_{1n}  \\
    c_{21} & c_{22} & \dots & c_{2n}  \\
    \vdots & \vdots & \vdots & \ddots \\
    c_{n1} & c_{n2} & \dots & c_{nn}  \\
\end{bmatrix}
=
\begin{bmatrix}
    a_{11} & a_{12} & \dots & a_{1n}  \\
    a_{21} & a_{22} & \dots & a_{2n}  \\
    \vdots & \vdots & \vdots & \ddots \\
    a_{n1} & a_{n2} & \dots & a_{nn}  \\
\end{bmatrix}
\cdot
\begin{bmatrix}
    b_{11} & b_{12} & \dots & b_{1n}  \\
    b_{21} & b_{22} & \dots & b_{2n}  \\
    \vdots & \vdots & \vdots & \ddots \\
    b_{n1} & a_{n2} & \dots & b_{nn}  \\
\end{bmatrix}
$$

- $c_{ij}=\sum_{1\leq k \leq n}a_{ik}.b_{kj}$
---

## References

TODO
