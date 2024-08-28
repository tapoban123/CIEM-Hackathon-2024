import streamlit as st
import pickle
import numpy as np

# Load the scaler, model, and class names
scaler = pickle.load(open("ml_model/scaler.pkl", 'rb'))
model = pickle.load(open("ml_model/model.pkl", 'rb'))
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

# Streamlit app
st.title("Career Recommendation System")

# User inputs
gender = st.selectbox("Gender", ["Male", "Female"])
part_time_job = st.checkbox("Part-time Job")
absence_days = st.slider("Absence Days", 0, 100, 0)
extracurricular_activities = st.checkbox("Extracurricular Activities")
weekly_self_study_hours = st.slider("Weekly Self Study Hours", 0, 40, 0)
math_score = st.slider("Math Score", 0, 100, 0)
history_score = st.slider("History Score", 0, 100, 0)
physics_score = st.slider("Physics Score", 0, 100, 0)
chemistry_score = st.slider("Chemistry Score", 0, 100, 0)
biology_score = st.slider("Biology Score", 0, 100, 0)
english_score = st.slider("English Score", 0, 100, 0)
geography_score = st.slider("Geography Score", 0, 100, 0)

# Calculated fields
total_score = math_score + history_score + physics_score + chemistry_score + biology_score + english_score + geography_score
average_score = total_score / 7

if st.button("Get Recommendations"):
    recommendations = Recommendations(gender, part_time_job, absence_days, extracurricular_activities,
                                      weekly_self_study_hours, math_score, history_score, physics_score,
                                      chemistry_score, biology_score, english_score, geography_score,
                                      total_score, average_score)
    
    st.subheader("Top 5 Career Recommendations")
    for career, prob in recommendations:
        st.write(f"{career}: {prob*100:.2f}%")


