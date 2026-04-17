<div align="center">
  
# QDTS

[**Esteban Gutiérrez**](https://cordutie.github.io/)<sup>1</sup>,
[**Behzad Haki**](https://behzadhaki.com/),
[**Christopher Haworth**](https://www.birmingham.ac.uk/staff/profiles/music/haworth-christopher.aspx)<sup>2</sup>,
[**Rodrigo Cádiz**](https://rodrigocadiz.com/music/)<sup>3,4</sup>, and 
[**Xavier Serra**](https://www.upf.edu/web/xavier-serra)<sup>1</sup>

<sup>1</sup> *Department of Information and Communications Technologies, Universitat Pompeu Fabra* <br>
<sup>2</sup> *Department of Music, University of Birmingham* <br>
<sup>3</sup> *Music Institute, Pontificia Universidad Católica de Chile* <br>
<sup>4</sup> *Department of Electrical Enginering, Pontificia Universidad Católica de Chile* <br>

<div align="left">

## Introduction

Cuadratic and cubic difference tones (QDT and CDT respectively) are
particular kinds of auditory distortion products (ADP) where two 
pure tones are used to generate the perceptual illusion of a third 
pure tone. This ADPs have been thoroughly studied and compared in the
last decades (see e.g. [[1]](#1), [[2]](#2) and [[3]](#3)),
and the necessary conditions to generate them are well known.
A Quadratic Difference Tone Spectrum (QDTS) on the other side, is a 
new kind of ADP where several pure tones are combined to generate a 
full spectrum made out of QDTs.

The theory behind the construction of a QDTS was first introduced in 
[[4]](#4), and a iterative method that solves the computations
needed to generate any given QDTS was first introduced in [[5]](#5). 

This repository contains an implementation as a Max external of 
the algorithm built in [[5]](#5) to generate QDTS. Additionally, a neural network approach to solve the same problem in a more controllable manner is added in this repository.

[![Alt text](https://i3.ytimg.com/vi/UodLZ9XQ_S0/maxresdefault.jpg)](https://youtu.be/UodLZ9XQ_S0)

## Experiments

The algorithms implemented use several standard mathematical and deep learning methods, however due to its heuristic nature, several experiments were made to validate them.

The experiments folder contains several python scripts that were used to gain a better understanding of the problem, to train the deep learning models and finally to validate the algorithms.

## Max

The max folder contains the source code to compile the objects and some example patches that can be used to try the models.

## References

<a id="1">[1]</a> J. B. Dewey, “Cubic and quadratic distortion products in vibrations of the mouse cochlear apex,” JASA Express Letters 2, vol. 11, no. 114402, 2022.\
<a id="2">[2]</a> E. Zwicker, “Different behaviour of quadratic and cubic difference tones,” Hearing Research, vol. 1, no. 4, pp. 283–292, 1979.\
<a id="3">[3]</a> R. Plomp, “Detectability threshold for combination tones,” The Journal of the Acoustical Society of America, vol. 37, no. 1110, 1965.\
<a id="4">[4]</a> G. Kendall, C. Haworth, and R. F. Cádiz, “Sound synthesis with auditory distortion products,” Computer Music Journal, vol. 38, no. 4, 2014.\
<a id="5">[5]</a> C. Haworth, E. Gutiérrez and R. F. Cádiz, “Generating Quadratic Difference Tone Spectra for Auditory Distortion Synthesis,” (to be published).
