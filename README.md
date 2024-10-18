# Email Spam Filter

## Overview
The Email Spam Filter project implements a system that filters incoming emails as spam or non-spam based on specific criteria and patterns using a combination of *Bloom Filters* and a *Naive Bayes* classifier. This system processes email addresses or domains associated with spam and trains a classifier to improve spam detection accuracy.

## Features
- *Bloom Filter* for efficient spam word lookup.
- *Naive Bayes Classifier* for classifying emails as spam or non-spam.
- Text preprocessing techniques such as tokenization and stemming.
- Simple command-line interface for testing spam filtering.

## Project Structure
The project consists of the following files:

- main.cpp: The main program for testing and email filtering.
- BloomFilter.h and BloomFilter.cpp: Implementation of the Bloom filter.
- NaiveBayesClassifier.h and NaiveBayesClassifier.cpp: Implementation of the Naive Bayes classifier.
- TextProcessor.h and TextProcessor.cpp: Text processing functions including tokenization.
- EmailProcessor.h and EmailProcessor.cpp: Integration of Bloom Filter and Naive Bayes classifier.

## Installation and Setup

### Prerequisites
- A C++ compiler (e.g., g++) installed on your machine.

### Steps to Run the Project

1. *Create a Directory for the Project*: 
   Create a folder named SpamFilterProject.

2. *Save the Files*: 
   Save the following files in the SpamFilterProject directory:
   - BloomFilter.h
   - BloomFilter.cpp
   - NaiveBayesClassifier.h
   - NaiveBayesClassifier.cpp
   - TextProcessor.h
   - TextProcessor.cpp
   - EmailProcessor.h
   - EmailProcessor.cpp
   - main.cpp

3. *Compile the Project*:
   Open a terminal in the SpamFilterProject folder and run the following command:
   ```bash
   g++ main.cpp BloomFilter.cpp NaiveBayesClassifier.cpp TextProcessor.cpp EmailProcessor.cpp -o spamfilter
