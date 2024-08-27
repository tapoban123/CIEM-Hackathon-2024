#!/usr/bin/env python
# coding: utf-8

# In[5]:


import pandas as pd

df1=pd.read_csv(r"C:\Users\roysu\Downloads\archive\archive (1)\student-scores.csv")


# In[33]:


import numpy as np


# In[6]:


df1


# In[7]:


df = df1.copy()


# In[ ]:


df


# In[8]:


df1.drop(columns=['id','first_name','last_name','email'],axis=1,inplace=True)


# In[9]:


df1


# In[10]:


df1['total_score']=df1['math_score']+df1['history_score']+df1['physics_score']+df1['chemistry_score']+df1['biology_score']+df1['english_score']+df1['geography_score']
df1['average_score']=df1['total_score']/7


# In[11]:


df1.head()


# In[12]:


df1['career_aspiration'].value_counts()


# In[13]:


gender_map={'male':0,'female':1}
part_time_job_map={False:0,True:1}
extracurricular_activities_map={False:0,True:1}

career_aspiration_map={
    'Lawyer':0,'Doctor':1,'Government Officer':2,'Artist':3,'Unknown':4,
    'Software Engineer':5,'Teacher':6,'Business Owner':7,'Scientist':8,
    'Banker':9,'Writer':10,'Accountant':11,'Designer':12,'Construction Engineer':13,
    'Game Developer':14,'Stock Investor':15,'Real Estate Developer':16
}
df1['gender']=df1['gender'].map(gender_map)
df1['part_time_job']=df1['part_time_job'].map(part_time_job_map)
df1['extracurricular_activities']=df1['extracurricular_activities'].map(extracurricular_activities_map)
df1['career_aspiration'] = df1['career_aspiration'].map(career_aspiration_map)


# In[14]:


df1


# In[15]:


df1.shape


# In[16]:


df1['career_aspiration'].value_counts()


# In[17]:


pip install imbalanced-learn


# In[ ]:


pip install --upgrade scikit-learn imbalanced-learn


# In[19]:


from imblearn.over_sampling import SMOTE
smote=SMOTE(random_state=42)
X=df1.drop('career_aspiration',axis=1)
y=df1['career_aspiration']
X_resampled,y_resampled=smote.fit_resample(X,y)


# In[20]:


from sklearn.model_selection import train_test_split
X_train,X_test,y_train,y_test = train_test_split(X_resampled,y_resampled,test_size=0.2,random_state=42)


# In[22]:


from sklearn.preprocessing import StandardScaler
scaler=StandardScaler()

X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled = scaler.transform(X_test)


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
    "XGBClassifier":XGBClassifier(use_label_encoder=False,eval_metric='mlogloss')
}


# In[37]:


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


# In[40]:


# Random forest classifier selected
model = RandomForestClassifier()
model.fit(X_train_scaled,y_train)
y_pred=model.predict(X_test_scaled)
    
accuracy = accuracy_score(y_test,y_pred)
classification_rep=classification_report(y_test,y_pred)
#     conf_matrix = confusion_matrix(y_test,y_pred)
    
print(accuracy)
print(classification_rep)


# In[41]:


print("Predicted label: ",model.predict(X_test_scaled[45].reshape(1,-1)))
print("Actual:",y_test.iloc[4])


# In[42]:


import pickle
pickle.dump(scaler,open("scaler.pkl",'wb'))
pickle.dump(model,open("model.pkl",'wb'))


# In[44]:


scaler=pickle.load(open("scaler.pkl",'rb'))
model=pickle.load(open("model.pkl",'rb'))


# In[55]:


import pickle
import numpy as np

# Load the scaler, label encoder, model, and class names
scaler = pickle.load(open("scaler.pkl", 'rb'))
model = pickle.load(open("model.pkl", 'rb'))
class_names = ['Lawyer', 'Doctor', 'Government Officer', 'Artist', 'Unknown',
               'Software Engineer', 'Teacher', 'Business Owner', 'Scientist',
               'Banker', 'Writer', 'Accountant', 'Designer',
               'Construction Engineer', 'Game Developer', 'Stock Investor',
               'Real Estate Developer']

def Recommendations(gender, part_time_job, absence_days, extracurricular_activities,
                    weekly_self_study_hours, math_score, history_score, physics_score,
                    chemistry_score, biology_score, english_score, geography_score,
                    total_score,average_score):
    
    # Encode categorical variables
    gender_encoded = 1 if gender.lower() == 'female' else 0
    part_time_job_encoded = 1 if part_time_job else 0
    extracurricular_activities_encoded = 1 if extracurricular_activities else 0
    
    # Create feature array
    feature_array = np.array([[gender_encoded, part_time_job_encoded, absence_days, extracurricular_activities_encoded,
                               weekly_self_study_hours, math_score, history_score, physics_score,
                               chemistry_score, biology_score, english_score, geography_score,total_score,average_score]])
    
    # Scale features
    scaled_features = scaler.transform(feature_array)
    
    # Predict using the model
    probabilities = model.predict_proba(scaled_features)
    
    # Get top five predicted classes along with their probabilities
    top_classes_idx = np.argsort(-probabilities[0])[:5]
    top_classes_names_probs = [(class_names[idx], probabilities[0][idx]) for idx in top_classes_idx]
    
    return top_classes_names_probs


# In[58]:


final = recommendation(gender='male',
                       part_time_job=False,
                       absence_days=0,
                       extracurricular_activities=False,
                       weekly_self_study_hours=16,
                       math_score=97,
                       history_score=90,
                       physics_score=90,
                       chemistry_score=85,
                       biology_score=74,
                       english_score=74,
                       geography_score=95,
                       total_score=695,
                       average_score=99.2)
print("Top recommended studies with probabilities:")
print("="*50)
for class_name, probability in final:
    print(f"{class_name} with probability {probability}")

