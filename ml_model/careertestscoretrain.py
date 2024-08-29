#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np


# In[2]:


df = pd.read_excel(r"C:\Users\roysu\OneDrive\Desktop\student data with career.xlsx")


# In[3]:


df1=df.copy()


# In[4]:


df1=df1.drop(columns=['id','first_name','last_name','email','gender'])


# In[5]:


df1


# In[6]:


df1['career_aspiration'].value_counts()


# In[7]:


career_aspiration_map={
    'Lawyer':0,'Doctor':1,'Government Officer':2,'Artist':3,'Finance officer':4,
    'Software Engineer':5,'Teacher':6,'Business Owner':7,'Scientist':8,
    'Banker':9,'Writer':10,'Accountant':11,'Designer':12,'Construction Engineer':13,
    'Game Developer':14,'Stock Investor':15,'Real Estate Developer':16,'Programmer':17,
    'Ethical hacker':18,'ML Engineer':19,'Data Analyst':20,'Stock investor':21,'Unknown':22
}
df1['career_aspiration'] = df1['career_aspiration'].map(career_aspiration_map)


# In[8]:


df1['career_aspiration']


# In[15]:


# Check the distribution of classes
print(y.value_counts())

# Ensure X and y are properly aligned and have no missing values
print(X.isnull().sum())
print(y.isnull().sum())


# In[23]:


from imblearn.over_sampling import SMOTE
from imblearn.over_sampling import ADASYN

#adasyn = ADASYN()
smote = SMOTE(k_neighbors=1,random_state=42)
X=df1.drop('career_aspiration',axis=1)
y=df1['career_aspiration']
X_resampled,y_resampled=smote.fit_resample(X,y)


# In[24]:


X=df1.drop(columns=['career_aspiration'],axis=1)
y=df1['career_aspiration']


# In[52]:


X


# In[25]:


y


# In[26]:


from sklearn.model_selection import train_test_split
X_train,X_test,y_train,y_test = train_test_split(X,y,test_size=0.2,random_state=42)


# In[59]:


from sklearn.preprocessing import StandardScaler
scaler1=StandardScaler()

X_train_scaled = scaler1.fit_transform(X_train)
X_test_scaled = scaler1.transform(X_test)


# In[28]:


from sklearn.linear_model import LogisticRegression
from sklearn.svm import SVC
from sklearn.ensemble import RandomForestClassifier
from sklearn.neighbors import KNeighborsClassifier
from sklearn.tree import DecisionTreeClassifier
from sklearn.naive_bayes import GaussianNB
from sklearn.ensemble import AdaBoostClassifier
from sklearn.ensemble import GradientBoostingClassifier
from xgboost import XGBClassifier
from sklearn.metrics import accuracy_score,classification_report,confusion_matrix
import warnings
warnings.filterwarnings("ignore")


# In[29]:


models={
    "Logistic Regression":LogisticRegression(),
    "Support Vector Classifier":SVC(),
    "Random Forest Classifier":RandomForestClassifier(),
    "KNeighborsClassifier":KNeighborsClassifier(),
    "DecisionTreeClassifier":DecisionTreeClassifier(),
    "GaussianNB":GaussianNB(),
    "AdaBoostClassifier":AdaBoostClassifier(),
    "GradientBoostingClassifier":GradientBoostingClassifier(),
}


# In[30]:


for name,model in models.items():
    print("="*50)
    print("Model:",name)
    model.fit(X_train_scaled,y_train)
    y_pred=model.predict(X_test_scaled)
    
    accuracy = accuracy_score(y_test,y_pred)
    classification_rep=classification_report(y_test,y_pred)
#     conf_matrix = confusion_matrix(y_test,y_pred)
    
    print(accuracy)
    print(classification_rep)
#     print(conf_matrix)


# In[65]:


# Random forest classifier selected
model1 = SVC(probability=True)
model1.fit(X_train_scaled,y_train)
y_pred=model1.predict(X_test_scaled)
    
accuracy = accuracy_score(y_test,y_pred)
classification_rep=classification_report(y_test,y_pred)
#     conf_matrix = confusion_matrix(y_test,y_pred)
    
print(accuracy)
print(classification_rep)


# In[36]:


X_test


# In[48]:


print("Predicted label: ",model.predict(X_test_scaled[1].reshape(1,-1)))
print("Actual:",y_test.iloc[1])


# In[60]:


import pickle
pickle.dump(scaler1,open("scaler1.pkl",'wb'))
pickle.dump(model1,open("model1.pkl",'wb'))


# In[72]:


import pickle
import numpy as np
from scipy.special import expit

# Load the scaler, label encoder, model, and class names
scaler1 = pickle.load(open("scaler1.pkl", 'rb'))
model1 = pickle.load(open("model1.pkl", 'rb'))
class_names = ['Lawyer','Doctor','Government Officer','Artist','Finance officer',
    'Software Engineer','Teacher','Business Owner','Scientist',
    'Banker','Writer','Accountant','Designer','Construction Engineer',
    'Game Developer','Stock Investor','Real Estate Developer','Programmer',
    'Ethical hacker','ML Engineer','Data Analyst','Stock investor','Unknown']

def Recommendations( math_score, aptitude_score, science_score,
                    logical_score, verbal_score):
    
    
    # Create feature array
    feature_array = np.array([[math_score, aptitude_score, science_score,
                    logical_score, verbal_score]])
    
    # Scale features
    scaled_features = scaler1.transform(feature_array)
    decision_scores = model1.decision_function(scaled_features)
    
    # Convert decision scores to probabilities (for binary classification)
    probabilities = expit(decision_scores)
    
    # Predict using the model
    #probabilities = model1.predict_proba(scaled_features)
    
    # Get top five predicted classes along with their probabilities
    top_classes_idx = np.argsort(-probabilities[0])[:3]
    top_classes_names_probs = [(class_names[idx], probabilities[0][idx]) for idx in top_classes_idx]
    
    return top_classes_names_probs


# In[77]:


final = Recommendations(80,90,95,96,95)
print("Top recommended studies with probabilities:")
print("="*50)
for class_name, probability in final:
    print(f"{class_name}")


# In[ ]:





# In[ ]:


math_score	aptitude_score	science_score	logical_score	verbal_score


# In[ ]:





# In[94]:


# Sample questions for the test
questions = {
    'maths': [
        "2*3",
        "5*4",
        "1*2",
        # ... Add more questions
    ],
    'aptitiude': [
        "If i go east and then move 90 degrees to left what direction i am facing?",
        "Logical Reasoning Question 2",
        "Logical Reasoning Question 3",
        # ... Add more questions
    ],
    'science': [
        "Science Question 1",
        "Science Question 2",
        "Science Question 3",
        # ... Add more questions
    ],
    'logical':[
        "Logical question 1",
        "Logical question 2",
        "logical question 3"
    ],
    'verbal':[
        'verbal question 1',
        'verbal question 2',
        'verbal question 3'
    ]
}

# Sample options for the questions
options = {
    'maths': [
        ["Option 1", "Option 2", "Option 3", "Option 4"],
        ["Option 1", "Option 2", "Option 3", "Option 4"],
        ["Option 1", "Option 2", "Option 3", "Option 4"],
        # ... Add more options
    ],
    'aptitiude': [
        ["Option 1", "Option 2", "Option 3", "Option 4"],
        ["Option 1", "Option 2", "Option 3", "Option 4"],
        ["Option 1", "Option 2", "Option 3", "Option 4"],
        # ... Add more options
    ],
    'science': [
        ["Option 1", "Option 2", "Option 3", "Option 4"],
        ["Option 1", "Option 2", "Option 3", "Option 4"],
        ["Option 1", "Option 2", "Option 3", "Option 4"],
        # ... Add more options
    ],
    'logical':[
        "Logical option 1",
        "Logical option 2",
        "logical option 3",
        "logical option 4"
    ],
    'verbal':[
        'verbal option 1',
        'verbal option 2',
        'verbal option 3',
        'verbal option 4'
    ]
    
}

# Correct answers for each question (for scoring)
answers = {
    'maths': [1, 2, 3],  # Example: index of the correct option
    'aptitude': [0, 2, 3],
    'science': [1, 1, 2],
    'logical':[1,0,2],
    'verbal':[0,0,3]
}


# In[97]:


# Example user answers
user_answers = {
    'maths': [1, 2, 3],  # Example: index of the correct option
    'aptitude': [0, 2, 3],
    'science': [1, 1, 2],
    'logical': [1, 0, 2],
    'verbal': [0, 0, 3]
}

# Example correct answers
correct_answers = {
    'maths': [1, 2, 3],  # Example correct answers
    'aptitude': [0, 2, 3],
    'science': [1, 1, 2],
    'logical': [1, 0, 2],
    'verbal': [0, 0, 3]
}

# Function to calculate scores
def calculate_scores(user_answers, correct_answers):
    scores = {}
    for category in user_answers:
        # Calculate the number of correct answers
        correct_count = sum(1 for i, answer in enumerate(user_answers[category]) if answer == correct_answers[category][i])
        # Each correct answer carries 10 points
        scores[category] = correct_count * 10
    return scores

# Calculate and print scores
scores = calculate_scores(user_answers, correct_answers)
print(scores)  # Example output: {'maths': 30, 'aptitude': 30, 'science': 30, 'logical': 20, 'verbal': 30}
feature_vector = [scores.get(category, 0) for category in ['maths', 'aptitude', 'science', 'logical', 'verbal']]


# In[99]:


final = Recommendations()
print("Top recommended studies with probabilities:")
print("="*50)
for class_name, probability in final:
    print(f"{class_name}")


# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[102]:


import pickle
import numpy as np
from scipy.special import expit

# Load the scaler, model, and class names
scaler1 = pickle.load(open("scaler1.pkl", 'rb'))
model1 = pickle.load(open("model1.pkl", 'rb'))
class_names = ['Lawyer', 'Doctor', 'Government Officer', 'Artist', 'Finance Officer',
                'Software Engineer', 'Teacher', 'Business Owner', 'Scientist',
                'Banker', 'Writer', 'Accountant', 'Designer', 'Construction Engineer',
                'Game Developer', 'Stock Investor', 'Real Estate Developer', 'Programmer',
                'Ethical Hacker', 'ML Engineer', 'Data Analyst', 'Stock Investor', 'Unknown']

def calculate_scores(user_answers, correct_answers):
    scores = {}
    for category in user_answers:
        correct_count = sum(1 for i, answer in enumerate(user_answers[category]) if answer == correct_answers[category][i])
        scores[category] = correct_count * 10
    return scores

def Recommendations(math_score, aptitude_score, science_score,
                    logical_score, verbal_score):
    # Create feature array
    feature_array = np.array([[math_score, aptitude_score, science_score,
                              logical_score, verbal_score]])
    
    # Scale features
    scaled_features = scaler1.transform(feature_array)
    decision_scores = model1.decision_function(scaled_features)
    
    # Convert decision scores to probabilities
    probabilities = expit(decision_scores)
    
    # Get top three predicted classes along with their probabilities
    top_classes_idx = np.argsort(-probabilities[0])[:3]
    top_classes_names_probs = [(class_names[idx], probabilities[0][idx]) for idx in top_classes_idx]
    
    return top_classes_names_probs

# Example user answers
user_answers = {
    'maths': [1, 2, 3],
    'aptitude': [0, 2, 3],
    'science': [1, 1, 2],
    'logical': [1, 0, 2],
    'verbal': [0, 0, 3]
}

# Example correct answers
correct_answers = {
    'maths': [1, 2, 3],
    'aptitude': [0, 2, 3],
    'science': [1, 1, 2],
    'logical': [1, 0, 2],
    'verbal': [0, 0, 3]
}

# Calculate scores
scores = calculate_scores(user_answers, correct_answers)

# Extract scores for the recommendation function
math_score = scores.get('maths', 0)
aptitude_score = scores.get('aptitude', 0)
science_score = scores.get('science', 0)
logical_score = scores.get('logical', 0)
verbal_score = scores.get('verbal', 0)

# Get recommendations
recommendations = Recommendations(math_score, aptitude_score, science_score, logical_score, verbal_score)

# Print recommendations
for recommendation in recommendations:
    print(f"Career: {recommendation[0]}")

