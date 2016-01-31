---
title       : BMI app
subtitle    : 
author      : K. Peters
job         : John Hopkins Data products course on Coursera
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [shiny, interactive]            
mode        : standalone # {standalone, draft}
knit        : slidify::knit2slides
output: html_document
---



## Background

Nutrition and weight control remain a growing problem for on the one hand third world countries and on the onther hand the western countries.

A lot of information on [Controlling the global obesity epidemic](http://www.who.int/nutrition/topics/obesity/en/) can be found on the [WHO nutrition website](http://www.who.int/nutrition/topics/en/) as well as a wealth of other health related data.

--- .class #id 

## Quantified self - self knowledge through numbers

People increasingly start to take measurements of their own physique and health to get a better understanding of their body and its condition.

More often than not these people will use the latest techniques and wearables to monitor themselves. Besides being quite expensive all the data can be quite overwhelming if you are not able to handle the data correctly.  

See the [Quantified self movement website](http://www.qsinstitute.org/) for more information



--- .class #id

## BMI
For those who wish to keep track on a budget:

One simple indicator of overall health is the Body Mass Index (BMI). BMI is used to categorize people  based on their body mass (kg) and height (m) by using the following formula ` BMI = mass/height^2`.

A set of BMI ranges determines wether you are underweight, normal or overweight.

Despite having some [downsides](http://www.livestrong.com/article/32791-disadvantages-bmi/), calculating your BMI is a quick and easy way to obtain insight of your overall health.

--- .class #id

## the BMI app

I'd like to highlight one minor downside which the Quantified Self movement and BMI calculation have in common. The output is just numbers! and we all know a graph says more than a thousand numbers!

So, check out [the app](https://kpeters.shinyapps.io/BMIapp/) to gain a visual representation of your BMI and how you are doing on the BMI scales!


