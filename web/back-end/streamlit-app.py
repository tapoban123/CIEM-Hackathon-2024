# import streamlit as st
# import pickle
# import numpy as np
# from scipy.special import expit

# # Load the scaler, model, and class names
# scaler1 = pickle.load(open("scaler1.pkl", 'rb'))
# model1 = pickle.load(open("model1.pkl", 'rb'))
# class_names = ['Lawyer', 'Doctor', 'Government Officer', 'Artist', 'Finance Officer',
#                 'Software Engineer', 'Teacher', 'Business Owner', 'Scientist',
#                 'Banker', 'Writer', 'Accountant', 'Designer', 'Construction Engineer',
#                 'Game Developer', 'Stock Investor', 'Real Estate Developer', 'Programmer',
#                 'Ethical Hacker', 'ML Engineer', 'Data Analyst', 'Stock Investor', 'Unknown']

# def calculate_scores(user_answers, correct_answers):
#     scores = {}
#     for category in user_answers:
#         correct_count = sum(1 for i, answer in enumerate(user_answers[category]) if answer == correct_answers[category][i])
#         scores[category] = correct_count * 10
#     return scores

# def Recommendations(math_score, aptitude_score, science_score,
#                     logical_score, verbal_score):
#     # Create feature array
#     feature_array = np.array([[math_score, aptitude_score, science_score,
#                               logical_score, verbal_score]])
    
#     # Scale features
#     scaled_features = scaler1.transform(feature_array)
#     decision_scores = model1.decision_function(scaled_features)
    
#     # Convert decision scores to probabilities
#     probabilities = expit(decision_scores)
    
#     # Get top three predicted classes along with their probabilities
#     top_classes_idx = np.argsort(-probabilities[0])[:3]
#     top_classes_names_probs = [(class_names[idx], probabilities[0][idx]) for idx in top_classes_idx]
    
#     return top_classes_names_probs

# def main():
#     st.title("Career Recommendation App")
#     st.write("Answer the following questions to get career recommendations.")

#     # Define questions and choices
#     questions = {
#         'maths': ['2*3', '5*4', '6*8'],
#         'aptitude': ['Q1_Aptitude_A', 'Q1_Aptitude_B', 'Q1_Aptitude_C'],
#         'science': ['Q1_Science_A', 'Q1_Science_B', 'Q1_Science_C'],
#         'logical': ['Q1_Logical_A', 'Q1_Logical_B', 'Q1_Logical_C'],
#         'verbal': ['Q1_Verbal_A', 'Q1_Verbal_B', 'Q1_Verbal_C']
#     }
#     options={

#     }
    
#     # Initialize answers
#     user_answers = {'maths': [], 'aptitude': [], 'science': [], 'logical': [], 'verbal': []}
    
#     # Collect user responses
#     for category, opts in questions.items():
#         st.write(f"**{category.capitalize()} Questions:**")
#         for idx, opt in enumerate(opts):
#             answer = st.selectbox(f"Select answer for {opt}", [0, 1, 2], index=0, key=f"{category}_{idx}")
#             user_answers[category].append(answer)
    
#     # Calculate scores and make recommendations
#     if st.button('Get Recommendations'):
#         # Example correct answers for testing
#         correct_answers = {
#             'maths': [1, 2, 3],
#             'aptitude': [0, 2, 3],
#             'science': [1, 1, 2],
#             'logical': [1, 0, 2],
#             'verbal': [0, 0, 3]
#         }
        
#         # Calculate scores
#         scores = calculate_scores(user_answers, correct_answers)
        
#         # Extract scores for the recommendation function
#         math_score = scores.get('maths', 0)
#         aptitude_score = scores.get('aptitude', 0)
#         science_score = scores.get('science', 0)
#         logical_score = scores.get('logical', 0)
#         verbal_score = scores.get('verbal', 0)
        
#         # Get recommendations
#         recommendations = Recommendations(math_score, aptitude_score, science_score, logical_score, verbal_score)
        
#         # Display recommendations
#         st.write("### Career Recommendations:")
#         for recommendation in recommendations:
#             st.write(f"**Career:** {recommendation[0]}, **Probability:** {recommendation[1]:.4f}")

# if __name__ == "__main__":
#     main()
import streamlit as st
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
        scores[category] = correct_count * 20
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

def main():
    st.title("Career Recommendation App")
    st.write("Answer the following questions to get career recommendations.")
    
    # Define questions and text options
    questions = {
        'maths': [
            "What is your answer to 2*3?",
            "What is your answer to 5*4?",
            "What is your answer to 6*3",
            "What is your answer to 7*4",
            "What is your answer to 10*9",
        ],
        'aptitude': [
            "What was the day of the week on 28th May, 2006?",
            "What was the day of the week on 17th June, 1998?",
            "What will be the day of the week 15th August, 2010?",
            "Today is Monday. After 61 days, it will be:",
            '''If 6th March, 2005 is Monday, what was the day of the week on 6th March, 2004?'''
,
        ],
        'science': [
            "What does DNA stand for?",
            "Which is hardest natural substance on Earth",
            "What is the extension of an excel file",
            "What is the full form of CPU?",
            "Who is known as the father of the computer?",
        ],
        'logical': [
            "If you have three apples and four oranges in one hand and four apples and three oranges in the other hand, what do you have?",
            "If it takes 5 machines 5 minutes to make 5 widgets, how long would it take 100 machines to make 100 widgets?",
            "You are in a dark room with a candle, a wood stove, and a gas lamp. You only have one match, so what do you light first?",
            "If you are running a race and pass the person in second place, what place are you in now?",
            "How many times can you subtract 10 from 100?",
        ],
        'verbal': [
            "What is the synonym of CORPULENT",
            "What is antonym of ENORMOUS?",
            "Choose the correct meaning of idiom 'To keeps one's temper'",
            "What is the passive voice of 'After driving professor Kumar to the museum she dropped him at his hotel'.",
            "Fill the blanks Fate smiles ...... those who untiringly grapple with stark realities of life.",
        ]
    }

    options = {
        'maths': ['6', '20', '18','28','90'],
        'aptitude': ['Sunday', 'Wednesday', 'Sunday','Saturday','Sunday'],
        'science': ['DeoxyRiboNucleicAcid', 'Diamond', '.xlsx','Central Processing Unit','Charles Babbage'],
        'logical': ['Big hands', '5 minutes', 'match','Second place','Once'],
        'verbal': ['Obese', 'Tiny', 'To be in good mood','After being driven to the museum, Professor Kumar was dropped at his hotel.','on']
    }
    
    # Initialize answers
    user_answers = {'maths': [], 'aptitude': [], 'science': [], 'logical': [], 'verbal': []}
    
    # Collect user responses
    for category in options:
        st.write(f"### {category.capitalize()} Questions:")
        for idx, question in enumerate(questions[category]):
            # Display text question and options
            answer = st.selectbox(question, options[category], index=0, key=f"{category}_{idx}")
            user_answers[category].append(answer)
    
    # Calculate scores and make recommendations
    if st.button('Get Recommendations'):
        # Example correct answers for testing
        correct_answers = {
            'maths': ['6', '20', '18','28','90'],
            'aptitude': ['Sunday', 'Wednesday', 'Sunday','Saturday','Sunday'],
            'science': ['DeoxyRiboNucleicAcid', 'Diamond', '.xlsx','Central Processing Unit','Charles Babbage'],
            'logical': ['Big hands', '5 minutes', 'match','Second place','Once'],
            'verbal': ['Obese', 'Tiny', 'To be in good mood','After being driven to the museum, Professor Kumar was dropped at his hotel.','on']
        }
        
        # Calculate scores
        scores = calculate_scores(user_answers, correct_answers)
        
        # Extract scores for the recommendation function
        math_score = scores.get('maths', 0)
        aptitude_score = scores.get('aptitude', 0)
        science_score = scores.get('science', 0)
        logical_score = scores.get('logical', 0)
        verbal_score = scores.get('verbal', 0)
        
        # Display scores
        st.write("### Your Scores:")
        st.write(f"**Maths Score:** {math_score}")
        st.write(f"**Aptitude Score:** {aptitude_score}")
        st.write(f"**Science Score:** {science_score}")
        st.write(f"**Logical Score:** {logical_score}")
        st.write(f"**Verbal Score:** {verbal_score}")
        
        # Get recommendations
        recommendations = Recommendations(math_score, aptitude_score, science_score, logical_score, verbal_score)
        
        # Display recommendations
        st.write("### Career Recommendations:")
        for recommendation in recommendations:
            st.write(f"**Congratulations, Career you should opt for :** {recommendation[0]}")

if __name__ == "__main__":
    main()

