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
footer: '![height:50px](http://erdogan.edu.tr/Images/Uploads/MyContents/L_379-20170718142719217230.jpg) RTEU CE100 Week-4'
title: "CE100 Algorithms and Programming II"
author: "Author: Asst. Prof. Dr. Uğur CORUH"
date:
subtitle: "Heap/Heap Sort"
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

<!--  -->

## CE100 Algorithms and Programming II

## Week-4 (Heap/Heap Sort)

#### Spring Semester, 2021-2022

Download [DOC](ce100-week-4-heap.md_doc.pdf), [SLIDE](ce100-week-4-heap.md_slide.pdf), [PPTX](ce100-week-4-heap.md_slide.pptx)

<iframe width=700, height=500 frameBorder=0 src="../ce100-week-4-heap.md_slide.html"></iframe>

---

<!-- paginate: true -->

## Heap/Heap Sort

## Outline (1)

- Heaps 
  
  - Max / Min Heap 

- Heap Data Structure 
  
  - Heapify 
    
    - Iterative 
    
    - Recursive 

---

## Outline (2)

- Extract-Max 

- Build Heap 

---

## Outline (3)

- Heap Sort 

- Priority Queues 

- Linked Lists 

- Radix Sort 

- Counting Sort 

---

## Heapsort

- Worst-case runtime: $O(nlgn)$
- Sorts in-place
- Uses a special data structure (heap) to manage information during execution of the algorithm
  - Another design paradigm

---

## Heap Data Structure (1)

- Nearly complete binary tree
  - Completely filled on all levels except possibly the lowest level

![alt:"alt" height:350px center](assets/ce100-week-4-heap-heap_1.drawio.svg)

---

## Heap Data Structure (2)

- **Height of node i:** Length of the longest simple downward path from **i** to a **leaf**
- **Height of the tree:** height of the **root**

![alt:"alt" height:400px center](assets/ce100-week-4-heap-heap_2.drawio.svg)

---

## Heap Data Structures (3)

- **Depth of node i:** Length of the simple downward path from the **root** to node **i**

![alt:"alt" height:350px center](assets/ce100-week-4-heap-heap_3.drawio.svg)

---

## Heap Property: Min-Heap

- The **smallest** element in any subtree is the **root** element in a **min-heap**

- **Min heap:** For every node **i** other than **root**, $A[parent(i)] \leq A[i]$
  
  - Parent node is always smaller than the child nodes

![bg right:40% w:480](assets/ce100-week-4-heap-heap_min_heap.drawio.svg)

---

## Heap Property: Max-Heap

- The **largest** element in any subtree is the **root** element in a **max-heap**
  - We will focus on max-heaps
- **Max heap:** For every node **i** other than **root**, $A[parent(i)] ≥ A[i]$
  - Parent node is always larger than the child nodes

![bg right:40% w:480](assets/ce100-week-4-heap-heap_max_heap.drawio.svg)

---

## Heap Data Structures (4)

![alt:"alt" height:500px center](assets/ce100-week-4-heap-heap_max_heap_1.drawio.svg)

---

## Heap Data Structures (5)

- Computing left child, right child, and parent indices very fast
  
  - **left(i) = 2i** $\Longrightarrow$ binary left shift
  - **right(i) = 2i+1** $\Longrightarrow$ binary left shift, then set the lowest bit to 1
  - **parent(i) = floor(i/2)** $\Longrightarrow$ right shift in binary

- $A[1]$ is always the **root** element

- Array $A$ has two attributes:
  
  - **length(A):** The number of elements in $A$
  - **n = heap-size(A):** The number elements in $heap$
    - $n \leq length(A)$

---

## Heap Operations : EXTRACT-MAX (1)

```r
EXTRACT-MAX(A, n)
  max = A[1]
  A[1] = A[n]
  n = n - 1
  HEAPIFY(A, 1,n)
  return max
```

---

## Heap Operations : EXTRACT-MAX (2)

- Return the max element,and reorganize the heap to maintain heap property

![alt:"alt" height:400px center](assets/ce100-week-4-heap-heap_extractmax.drawio.svg)

---

## Heap Operations: HEAPIFY (1)

![alt:"alt" height:500px center](assets/ce100-week-4-heap-heap_heapify.drawio.svg)

---

## Heap Operations: HEAPIFY (2)

- Maintaining heap property:
  - Subtrees rooted at $left[i]$ and $right[i]$ are already heaps.
  - But, $A[i]$ may violate the heap property (i.e., may be smaller than its children)
- **Idea:** Float down the value at $A[i]$ in the heap so that subtree rooted at $i$ becomes a heap.

---

## Heap Operations: HEAPIFY (2)

```r
HEAPIFY(A, i, n)
  largest = i 

  if 2i <= n and A[2i] > A[i] then 
    largest = 2i;
  endif

  if 2i+1 <= n and A[2i+1] > A[largest] then 
    largest = 2i+1;
  endif

  if largest != i  then
    exchange A[i] with A[largest];
    HEAPIFY(A, largest, n);
  endif
```

---

## Heap Operations: HEAPIFY (3)

![alt:"alt" height:500px center](assets/ce100-week-4-heap-heap_heapify_2.drawio.svg)

---

## Heap Operations: HEAPIFY (4)

![alt:"alt" height:500px center](assets/ce100-week-4-heap-heap_heapify_3.drawio.svg)

---

## Heap Operations: HEAPIFY (5)

![alt:"alt" height:500px center](assets/ce100-week-4-heap-heap_heapify_4.drawio.svg)

---

## Heap Operations: HEAPIFY (6)

![alt:"alt" height:500px center](assets/ce100-week-4-heap-heap_heapify_5.drawio.svg)

---

## Heap Operations: HEAPIFY (7)

![alt:"alt" height:500px center](assets/ce100-week-4-heap-heap_heapify_6.drawio.svg)

---

## Heap Operations: HEAPIFY (8)

![alt:"alt" height:500px center](assets/ce100-week-4-heap-heap_heapify_7.drawio.svg)

---

## Intuitive Analysis of HEAPIFY

- Consider $HEAPIFY(A, i, n)$
  - let $h(i)$ be the height of node $i$
  - at most $h(i)$ recursion levels
    - Constant work at each level: $\Theta(1)$ 
  - Therefore $T(i)=O(h(i))$
- Heap is almost-complete binary tree
  - $h(n)=O(lgn)$ 
- Thus $T(n)=O(lgn)$ 

---

## Formal Analysis of HEAPIFY

- **What is the recurrence?**
  - Depends on the size of the **subtree** on which recursive call is made
    - In the next, we try to compute an **upper bound** for this **subtree**.

---

## Reminder: Binary trees

- For a complete binary tree:
  - $\#$ of nodes at depth $d$:  $2^d$
  - $\#$ of nodes with depths less than $d$:  $2^d-1$

![alt:"alt" height:450px center](assets/ce100-week-4-heap-heap_binary_depth.drawio.svg)

---

## Formal Analysis of HEAPIFY (1)

- Worst case occurs when last row of the subtree $S_i$ rooted at node $i$ is **half full**

- $T(n) \leq T(|S_{L(i)}|) + \Theta(1)$ 

- $S_{L(i)}$ and $S_{R(i)}$ are complete binary trees of heights  $h(i)-1$ and $h(i)-2$, respectively

![bg right:50% w:600](assets/ce100-week-4-heap-heap_analysis_1.drawio.svg)

---

## Formal Analysis of HEAPIFY (2)

- Let $m$ be the number of **leaf nodes** in $S_{L(i)}$
  - $|S_{L(i)}|=\overbrace{m}^{ext.}+\overbrace{(m–1)}^{int.}=2m–1$ 
  - $|S_{R(i)}|=\overbrace{\frac{m}{2}}^{ext.}+\overbrace{(\frac{m}{2}–1)}^{int.}=m–1$
  - $|S_{L(i)}|+|S_{R(i)}|+1=n$

---

## Formal Analysis of HEAPIFY (2)

$$ 
\begin{align*}
(2m–1)+(m–1)+1 &=n \\ 
m &= (n+1)/3 \\
|S_{L(i)}| &= 2m – 1 \\
&=2(n+1)/3 – 1 \\
&=(2n/3+2/3) –1 \\
&=\frac{2n}{3}-\frac{1}{3} \leq \frac{2n}{3} \\
T(n) & \leq T(2n/3) + \Theta(1) \\
T(n) &= O(lgn)
\end{align*}
$$

- **By CASE-2 of Master Theorem** $\Longrightarrow$ $T(n)=\Theta(n^{log_b^a}lgn)$

---

## Formal Analysis of HEAPIFY (2)

- Recurrence: $T(n) = aT(n/b) + f(n)$

- *Case 2:* $\frac{f(n)}{n^{log_b^a}}=\Theta(1)$

- i.e., $f(n)$ and $n^{log_b^a}$ grow at similar rates

- **Solution:** $T(n)=\Theta(n^{log_b^a}lgn)$
  
  - $T(n) \leq T(2n/3) + \Theta(1)$ (drop constants.)
  - $T(n) \leq \Theta(n^{log_3^1}lgn)$ 
  - $T(n) \leq \Theta(n^0lgn)$
  - $T(n) = O(lgn)$

---

## HEAPIFY: Efficiency Issues

- **Recursion vs Iteration:**
  - In the absence of tail recursion, **iterative version** is in general **more efficient** because of the **pop/push** operations **to/from** stack at each **level of recursion**.

---

## Heap Operations: HEAPIFY (1)

**Recursive**

```r
  HEAPIFY(A, i, n)
  largest = i 

  if 2i <= n and A[2i] > A[i] then 
    largest = 2i

  if 2i+1 <= n and A[2i+1] > A[largest] then 
    largest = 2i+1

  if largest != i  then
    exchange A[i] with A[largest]
    HEAPIFY(A, largest, n)
```

---

## Heap Operations: HEAPIFY (2)

**Iterative**

```r
HEAPIFY(A, i, n)
  j = i
  while(true) do
    largest = j 

  if 2j <= n and A[2j] > A[j] then 
    largest = 2j

  if 2j+1 <= n and A[2j+1] > A[largest] then 
    largest = 2j+1

  if largest != j  then
    exchange A[j] with A[largest]
    j = largest
  else return
```

---

## Heap Operations: HEAPIFY (3)

![alt:"alt" height:500px center](assets/ce100-week-4-heap-heap_heapify_iter_recur.drawio.svg)

---

## Heap Operations: Building Heap

- Given an arbitrary array, how to build a heap from scratch?

- **Basic idea:** Call $HEAPIFY$ on each node bottom up 
  
  - Start from the leaves (which trivially satisfy the heap property)
  - Process nodes in bottom up order.
  - When $HEAPIFY$ is called on node $i$, the subtrees connected to the $left$ and $right$ subtrees already satisfy the heap property.
  
  ![bg right:25% w:300px](assets/ce100-week-4-heap-heap_build_common_1.drawio.svg) 

---

## Storage of the leaves (Lemma)

- **Lemma:** The last $\lceil \frac{n}{2} \rceil$ nodes of a heap are all leaves. 

<!-- 
![alt:"alt" height:450px center](assets/ce100-week-4-heap-heap_heap_leaves.drawio.svg) 
-->

![bg right:70% w:800](assets/ce100-week-4-heap-heap_heap_leaves.drawio.svg)

---

## Storage of the leaves (Proof of Lemma) (1)

- **Lemma:** last $\lceil n/2 \rceil$ nodes of a heap are all leaves
- Proof : 
  - $m=2^{d-1}$: $\#$ nodes at level $d-1$
  - $f$: $\#$ nodes at level $d$ (last level)
- $\#$ of nodes with depth $d-1$ : $m$
- $\#$ of nodes with depth $<d-1$ : $m-1$
- $\#$ of nodes with depth $d$ : $f$
- **Total** $\#$ of nodes :$n=f+2m-1$

![bg right:40% w:480](assets/ce100-week-4-heap-heap_stored_leaves_lemma.drawio.svg)

---

## Storage of the leaves (Proof of Lemma) (2)

- **Total** $\#$ of nodes : $f=n-2m+1$

$$
\begin{align*}
\text{\# of leaves: }&=f+m-\lceil f/2 \rceil \\
&= m+\lfloor f/2 \rfloor \\
&= m+\lfloor (n-2m+1)/2 \rfloor \\
&= \lfloor (n+1)/2 \rfloor \\
&= \lceil n/2 \rceil
\end{align*}
$$

Proof is Completed

![bg right:40% w:480](assets/ce100-week-4-heap-heap_stored_leaves_lemma.drawio.svg)

---

## Heap Operations: Building Heap

```r
BUILD-HEAP (A, n)
  for i = ceil(n/2) downto 1 do
    HEAPIFY(A, i, n)
```

- **Reminder:** The last $\lceil n/2 \rceil$ nodes of a heap are **all leaves**, which trivially satisfy the heap property

---

## Build-Heap Example (Step-1)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_build_1.drawio.svg)

---

## Build-Heap Example (Step-2)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_build_2.drawio.svg)

---

## Build-Heap Example (Step-3)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_build_3.drawio.svg)

---

## Build-Heap Example (Step-4)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_build_4.drawio.svg)

---

## Build-Heap Example (Step-5)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_build_5.drawio.svg)

---

## Build-Heap Example (Step-6)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_build_6.drawio.svg)

---

## Build-Heap Example (Step-7)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_build_7.drawio.svg)

---

## Build-Heap Example (Step-8)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_build_8.drawio.svg)

---

## Build-Heap Example (Step-9)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_build_9.drawio.svg)

---

## Build-Heap: Runtime Analysis

- Simple analysis:
  
  - $O(n)$ calls to $HEAPIFY$, each of which takes $O(lgn)$ time
  - $O(nlgn)$ $\Longrightarrow$ loose bound

- In general, a good approach:
  
  - Start by proving an easy bound
  - Then, try to tighten it

- Is there a tighter bound?

---

## Build-Heap: **Tighter** Running Time Analysis

- If the heap is complete binary tree then $h_{\ell} = d – \ell$
- Otherwise, nodes at a given level do not all have the same height, But we have $d – \ell – 1 \leq h_{\ell} \leq d – \ell$

![alt:"alt" height:420px center](assets/ce100-week-4-heap-heap_tight_running_time_analysis.drawio.svg) 

---

## Build-Heap: **Tighter** Running Time Analysis

- Assume that all nodes at level $\ell= d – 1$ are processed 

$$
\begin{align*}
  T(n) &=\sum_{\ell=0}^{d-1}n_{\ell}O(h_{\ell})=O(\sum_{\ell=0}^{d-1}n_{\ell}h_{\ell})

  \begin{cases}
   n_{\ell}=2^{\ell} = \# \text{ of nodes at level }\ell \\

   h_{\ell}=\text{height of nodes at level } \ell
  \end{cases} \\

\therefore T(n) &= O \bigg( \sum_{\ell=0}^{d-1}2^{\ell}(d-\ell) \bigg) \\

\text{Let } & h=d-\ell \Longrightarrow \ell = d-h \text{ change of variables} \\ 

T(n) &= O\bigg(\sum_{h=1}^{d}h2^{d-h} \bigg)=O\bigg(\sum_{h=1}^{d}h \frac{2^d}{2^h} \bigg) = O\bigg(2^d\sum_{h=1}^{d}h (1/2)^h\bigg) \\

\text{ but } & 2^d = \Theta(n) \Longrightarrow O\bigg(n\sum_{h=1}^{d}h (1/2)^h \bigg)
\end{align*}
$$

---

## Build-Heap: **Tighter** Running Time Analysis

$$
\sum_{h=1}^{d}h(1/2)^h \leq  \sum_{h=0}^{d}h(1/2)^h \leq \sum_{h=0}^{\infty}h(1/2)^h 
$$

- recall infinite decreasing geometric series
  
  $$
  \sum_{k=0}^{\infty}x^k = \frac{1}{1-x} \text{ where } |x|<1 
  $$
- differentiate both sides
  
  $$
  \sum_{k=0}^{\infty}kx^{k-1} = \frac{1}{(1-x)^2}  
  $$

---

## Build-Heap: **Tighter** Running Time Analysis

$$
\sum_{k=0}^{\infty}kx^{k-1} = \frac{1}{(1-x)^2}  
$$

- then, multiply both sides by $x$
  
  $$
  \sum_{k=0}^{\infty}kx^k = \frac{x}{(1-x)^2}  
  $$
- in our case: $x = 1/2$ and $k = h$
  
  $$
  \therefore \sum_{h=0}^{\infty}h(1/2)^h = \frac{1/2}{(1-(1/2))^2}=2=O(1) \\
\therefore T(n)=O(n\sum_{h=1}^{d}h(1/2)^h)=O(n)  
  $$

---

## Heapsort Algorithm Steps

- **(1)** Build a heap on array $A[1 \dots n]$ by calling $BUILD-HEAP(A, n)$
- **(2)** The largest element is stored at the root $A[1]$ 
  - Put it into its correct final position $A[n]$ by $A[1] \longleftrightarrow A[n]$
- **(3)** Discard node $n$ from the heap
- **(4)** Subtrees $(S2 \& S3)$ rooted at children of root remain as heaps, but the new root element may violate the heap property. 
  - Make $A[1 \dots n-1]$ a heap by calling $HEAPIFY(A,1,n-1)$
- **(5)** $n \leftarrow n-1$
- **(6)** Repeat steps **(2-4)** until $n=2$

---

## Heapsort Algorithm Example (Step-1)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_sort_step_1.drawio.svg)

---

## Heapsort Algorithm Example (Step-2)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_sort_step_2.drawio.svg)

---

## Heapsort Algorithm Example (Step-3)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_sort_step_3.drawio.svg)

---

## Heapsort Algorithm Example (Step-4)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_sort_step_4.drawio.svg)

---

## Heapsort Algorithm Example (Step-5)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_sort_step_5.drawio.svg)

---

## Heapsort Algorithm Example (Step-6)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_sort_step_6.drawio.svg)

---

## Heapsort Algorithm Example (Step-7)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_sort_step_7.drawio.svg)

---

## Heapsort Algorithm Example (Step-8)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_sort_step_8.drawio.svg)

---

## Heapsort Algorithm Example (Step-9)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_sort_step_9.drawio.svg)

---

## Heapsort Algorithm Example (Step-10)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_sort_step_10.drawio.svg)

---

## Heapsort Algorithm Example (Step-11)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_sort_step_11.drawio.svg)

---

## Heapsort Algorithm Example (Step-12)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_sort_step_12.drawio.svg)

---

## Heapsort Algorithm Example (Step-13)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_sort_step_13.drawio.svg)

---

## Heapsort Algorithm Example (Step-14)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_sort_step_14.drawio.svg)

---

## Heapsort Algorithm Example (Step-15)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_sort_step_15.drawio.svg)

---

## Heapsort Algorithm Example (Step-16)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_sort_step_16.drawio.svg)

---

## Heapsort Algorithm Example (Step-17)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_sort_step_17.drawio.svg)

---

## Heapsort Algorithm Example (Step-18)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_sort_step_18.drawio.svg)

---

## Heapsort Algorithm Example (Step-19)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_sort_step_19.drawio.svg)

---

## Heapsort Algorithm: Runtime Analysis

![center height:250px](assets/ce100-week-4-heap-heap_sort_runtime_1.drawio.svg)

$$
\begin{align*}
T(n) &= \Theta(n)+\sum_{i=2}^{n}O(lgi) \\
&= \Theta(n)+O\bigg( \sum_{i=2}^{n}O(lgn) \bigg) \\
&= O(nlgn)
\end{align*}
$$

---

## Heapsort - Notes

- **Heapsort** is a very good algorithm but, a good implementation of **quicksort** always **beats** heapsort **in practice**
- However, **heap data structure** has many popular applications, and it can be efficiently used for implementing **priority queues**

---

## Data structures for **Dynamic Sets**

- Consider sets of records having **key** and **satellite** data

![center height:300px](assets/ce100-week-4-heap-dynamic_set.drawio.svg)

---

## Operations on **Dynamic Sets**

- **Queries:** Simply return info; 
  - $MAX(S) / MIN(S):$ (Query) return $x \in S$ with the **largest/smallest** $key$
  - $SEARCH(S, k):$ (Query) return $x \in S$ with $key[x]= k$
  - $SUCCESSOR(S, x) / PREDECESSOR(S, x):$ (Query) return $y \in S$ which is the next **larger/smaller** element after $x$
- **Modifying operations:** Change the set
  - $INSERT(S, x):$ (Modifying) $S \leftarrow S \cup \{x\}$
  - $DELETE(S, x):$ (Modifying) $S \leftarrow S - \{x\}$
  - $\text{EXTRACT-MAX}(S) / \text{EXTRACT-MIN}(S):$ (Modifying) return and delete $x \in S$ with the largest/smallest $key$
- Different data structures support/optimize different operations

---

## Priority Queues (PQ)

- Supports
  - $INSERT$
  - $MAX / MIN$ 
  - $\text{EXTRACT-MAX} / \text{EXTRACT-MIN}$

---

## Priority Queues (PQ)

- **One application:** Schedule jobs on a shared resource 
  - **PQ** keeps track of jobs and their relative priorities
  - When a job is finished or interrupted, highest priority job is selected from those pending using $\text{EXTRACT-MAX}$
  - A new job can be added at any time using $INSERT$

---

## Priority Queues (PQ)

- **Another application:** Event-driven simulation
  - Events to be simulated are the items in the **PQ** 
  - Each event is associated with a time of occurrence which serves as a $key$
  - Simulation of an event can cause other events to be simulated in the future
  - Use $\text{EXTRACT-MIN}$ at each step to choose the next event to simulate
  - As new events are produced insert them into the **PQ** using $INSERT$

---

## Implementation of **Priority Queue**

- **Sorted linked list:** Simplest implementation
  - $INSERT$
    - $O(n)$ time
    - Scan the list to find place and splice in the new item
  - $\text{EXTRACT-MAX}$
    - $O(1)$ time
    - Take the first element
  - **Fast** extraction but **slow** insertion.

---

## Implementation of **Priority Queue**

- **Unsorted linked list:** Simplest implementation
  
  - $INSERT$
    - $O(1)$ time
    - Put the new item at front
  - $\text{EXTRACT-MAX}$
    - $O(n)$ time
    - Scan the whole list
  - **Fast** insertion but **slow** extraction.

- Sorted linked list is better on the average
  
  - **Sorted list:** on the average, scans $n/2$ element per insertion
  - **Unsorted list:** always scans $n$ element at each extraction

---

## Heap Implementation of **PQ**

- $INSERT$ and $\text{EXTRACT-MAX}$ are both $O(lgn)$
  - good compromise between fast insertion but slow extraction and vice versa
- $\text{EXTRACT-MAX}$: already discussed $\text{HEAP-EXTRACT-MAX}$
- $INSERT$: Insertion is like that of Insertion-Sort. 

```r
HEAP-INSERT(A, key, n)
  n = n+1
  i=n  
  while i>1 and A[floor(i/2)] < key do
    A[i]=A[floor(i/2)] 
    i= floor(i/2)
  A[i]=key
```

---

## Heap Implementation of **PQ**

- Traverses $O(lgn)$ nodes, as $HEAPIFY$ does but makes fewer comparisons and assignments
  - $HEAPIFY$: compares parent with both children
  - $HEAP-INSERT$: with only one 

---

## HEAP-INSERT Example (Step-1)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_insert_1.drawio.svg)

---

## HEAP-INSERT Example (Step-2)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_insert_2.drawio.svg)

---

## HEAP-INSERT Example (Step-3)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_insert_3.drawio.svg)

---

## HEAP-INSERT Example (Step-4)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_insert_4.drawio.svg)

---

## HEAP-INSERT Example (Step-5)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_insert_5.drawio.svg)

---

## Heap Increase Key

- Key value of $i^{th}$ element of heap is increased from $A[i]$ to $key$

```r
HEAP-INCREASE-KEY(A, i, key)

  if key < A[i] then
    return error

  while i > 1 and A[floor(i/2)] < key do
    A[i] = A[floor(i/2)] 
    i = floor(i/2)

  A[i] = key
```

---

## HEAP-INCREASE-KEY Example (Step-1)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_increase_key_1.drawio.svg)

---

## HEAP-INCREASE-KEY Example (Step-2)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_increase_key_2.drawio.svg)

---

## HEAP-INCREASE-KEY Example (Step-3)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_increase_key_3.drawio.svg)

---

## HEAP-INCREASE-KEY Example (Step-4)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_increase_key_4.drawio.svg)

---

## HEAP-INCREASE-KEY Example (Step-5)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_increase_key_5.drawio.svg)

---

## Heap Implementation of Priority Queue (PQ)

![bg right:70% w:800px](assets/ce100-week-4-heap-heap_imp_pq.drawio.svg)

---

## Summary: **Max Heap**

- **Heapify(A, i)**
  - Works when both child subtrees of node i are heaps
  - "*Floats down*" node i to satisfy the heap property
  - Runtime: $O(lgn)$
- **Max(A, n)**
  - Returns the max element of the heap (no modification)
  - Runtime: $O(1)$
- **Extract-Max(A, n)**
  - Returns and removes the max element of the heap
  - Fills the gap in $A[1]$ with $A[n]$, then calls **Heapify(A,1)**
  - Runtime: $O(lgn)$

---

## Summary: **Max Heap**

- **Build-Heap(A, n)**
  - Given an arbitrary array, builds a heap from scratch
  - Runtime: $O(n)$
- **Min(A, n)**
  - How to return the min element in a max-heap?
  - Worst case runtime: $O(n)$
    - because ~half of the heap elements are leaf nodes
  - Instead, use a min-heap for efficient min operations
- **Search(A, x)**
  - For an arbitrary $x$ value, the worst-case runtime: $O(n)$
  - Use a sorted array instead for efficient search operations

---

## Summary: **Max Heap**

- **Increase-Key(A, i, x)**
  - Increase the key of node $i$ (from $A[i]$ to $x$)
  - “*Float up*” $x$ until heap property is satisfied
  - Runtime: $O(lgn)$
- **Decrease-Key(A, i, x)**
  - Decrease the key of node $i$ (from $A[i]$ to $x$)
  - Call **Heapify(A, i)**
  - Runtime: $O(lgn)$

---

## **Phone Operator** Problem

![bg right:40% w:500px](assets/ce100-week-4-heap-phone_operator.drawio.svg)

- A phone operator answering **$n$ phones**

- Each phone $i$ has **$x_i$ people waiting** in line for their calls to be answered.

- Phone operator needs to answer the phone with the largest number of people waiting in line.

- New calls come continuously, and
  some people hang up after waiting.

---

## **Phone Operator** Solution

- **Step 1:** Define the following array:

- $A[i]$: the ith element in heap

- $A[i].id$: the index of the corresponding phone

- $A[i].key$: $\#$ of people waiting in line for phone with index $A[i].id$

![bg right:30% w:200px](assets/ce100-week-4-heap-phone_operator_2.drawio.svg)

---

## **Phone Operator** Solution

- **Step 2:** $\text{Build-Max-Heap}(A, n)$
  - **Execution:**
    - When the operator wants to answer a phone:
      - $id = A[1].id$
        - $\text{Decrease-Key}(A, 1, A[1].key-1)$
        - answer phone with index $id$
      - When a new call comes in to phone i:
        - $\text{Increase-Key}(A, i, A[i].key+1)$
      - When a call drops from phone i:
        - $\text{Decrease-Key}(A, i, A[i].key-1)$

---

## Linked Lists

- Like arrays, Linked List is a linear data structure.
- Unlike arrays, linked list elements are not stored at a contiguous location; the elements are linked using pointers.

![bg right:60% w:730px](assets/ce100-week-4-heap-linkedlist.drawio.svg)

---

## Linked Lists - C Definition

- C
  
  ```c
  // A linked list node
  struct Node {
    int data;
    struct Node* next;
  };
  ```

---

## Linked Lists - Cpp Definition

- Cpp
  
  ```c++
  class Node {
  public:
    int data;
    Node* next;
  };
  ```

---

## Linked Lists - Java Definition

- Java
  
  ```java
  class LinkedList {
    Node head; // head of the list
  
    /* Linked list Node*/
    class Node {
        int data;
        Node next;
  
        // Constructor to create a new node
        // Next is by default initialized
        // as null
        Node(int d) { data = d; }
    }
  }
  ```

---

## Linked Lists - Csharp Definition

- Csharp
  
  ```cs
  class LinkedList {
    // The first node(head) of the linked list
    // Will be an object of type Node (null by default)
    Node head;
  
    class Node {
        int data;
        Node next;
  
        // Constructor to create a new node
        Node(int d) { data = d; }
    }
  }
  ```

---

## Priority Queue using **Linked List** Methods

- Implement Priority Queue using Linked Lists. 
  - **push():** This function is used to insert a new data into the queue.
  - **pop():** This function removes the element with the highest priority from the queue.
  - **peek()/top():** This function is used to get the highest priority element in the queue without removing it from the queue.

---

## Priority Queue using **Linked List** Algorithm

```r
PUSH(HEAD, DATA, PRIORITY)
  Create NEW.Data = DATA & NEW.Priority = PRIORITY
  If HEAD.priority < NEW.Priority 
    NEW -> NEXT = HEAD
    HEAD = NEW 
  Else
    Set TEMP to head of the list 
  Endif

  WHILE TEMP -> NEXT != NULL and TEMP -> NEXT ->PRIORITY > PRIORITY THEN
    TEMP = TEMP -> NEXT 
  ENDWHILE

  NEW -> NEXT = TEMP -> NEXT 
  TEMP -> NEXT = NEW 
```

---

## Priority Queue using **Linked List** Algorithm

```r
POP(HEAD)
//Set the head of the list to the next node in the list.
HEAD = HEAD -> NEXT.
Free the node at the head of the list
```

```r
PEEK(HEAD): 
Return HEAD -> DATA 
```

---

## Priority Queue using **Linked List** Notes

- LinkedList is already sorted. 
- Time Complexities and Comparison with Binary Heap

|             | peek() | push()   | pop()    |
| ----------- | ------ | -------- | -------- |
| Linked List | $O(1)$ | $O(n)$   | $O(1)$   |
| Binary Heap | $O(1)$ | $O(lgn)$ | $O(lgn)$ |

---

## Sorting in Linear Time

---
## How Fast Can We Sort?

---

## References

- [Introduction to Algorithms, Third Edition | The MIT Press](https://mitpress.mit.edu/books/introduction-algorithms-third-edition)

- [Bilkent CS473 Course Notes (new)](http://nabil.abubaker.bilkent.edu.tr/473/)

- [Bilkent CS473 Course Notes (old)](http://cs.bilkent.edu.tr/~ugur/teaching/cs473/)

- [Insertion Sort - GeeksforGeeks](https://www.geeksforgeeks.org/insertion-sort/)

- [Priority Queue Using Linked List - GeeksforGeeks](https://www.geeksforgeeks.org/priority-queue-using-linked-list/)

- [Priority Queue Using Linked List - JavatPoint](https://www.javatpoint.com/priority-queue-using-linked-list)

- [NIST Dictionary of Algorithms and Data Structures](https://xlinux.nist.gov/dads/)

- [NIST - Dictionary of Algorithms and Data Structures](https://xlinux.nist.gov/dads/)

---

$EOF$ 
