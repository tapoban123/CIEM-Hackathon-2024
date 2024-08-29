from app.models import Scores
from fastapi import FastAPI
from scipy.special import expit
import pickle
import numpy as np

app = FastAPI()

# Load the scaler, model, and class names
scaler1 = pickle.load(open("scaler1.pkl", 'rb'))
model1 = pickle.load(open("model1.pkl", 'rb'))

@app.get("/")
def home():
    return {"details": "hello world"}



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

@app.post("/check_ml")
def Recommendations(scores: Scores):
    # Create feature array
    feature_array = np.array([[scores.math_score, scores.aptitude_score, scores.science_score,
                              scores.logical_score, scores.verbal_score]])
    
    # Scale features
    scaled_features = scaler1.transform(feature_array)
    decision_scores = model1.decision_function(scaled_features)
    
    # Convert decision scores to probabilities
    probabilities = expit(decision_scores)
    
    # Get top three predicted classes along with their probabilities
    top_classes_idx = np.argsort(-probabilities[0])[:3]
    top_classes_names_probs = [(class_names[idx], probabilities[0][idx]) for idx in top_classes_idx]
    
    return {"detail":top_classes_names_probs}


def display_questions_and_get_answers(options, questions):
    user_answers = {category: [] for category in options}

    for category in options:
        print(f"\n{category.capitalize()} Questions:")
        for idx, question in enumerate(questions[category]):
            print(f"{idx + 1}. {question}")
            print("Options:")
            for i, option in enumerate(options[category]):
                print(f"   {i + 1}. {option}")

            while True:
                try:
                    answer_idx = int(input(f"Select an option (1-{len(options[category])}): ")) - 1
                    if 0 <= answer_idx < len(options[category]):
                        answer = options[category][answer_idx]
                        user_answers[category].append(answer)
                        break
                    else:
                        print("Invalid option. Please select a valid option.")
                except ValueError:
                    print("Invalid input. Please enter a number.")

    return user_answers
