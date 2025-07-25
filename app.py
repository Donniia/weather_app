from flask import Flask, request, jsonify
import pickle
import numpy as np
from flask_cors import CORS
import traceback

app = Flask(__name__)
CORS(app)

# Load the model from the pickle file
file_path = "random_forest_model.pkl"
with open(file_path, 'rb') as file:
    model = pickle.load(file)

@app.route('/')
def home():
    return "welcome"

@app.route('/predict', methods=['POST'])
def predict():
    try:
        data = request.json
        print("Received data:", data)

        if 'features' not in data:
            return jsonify({'error': "'features' key not found in request"}), 400

        features = data['features']


        features = np.array(features).reshape(1, -1)


        prediction = model.predict(features)


        return jsonify({'prediction': prediction.tolist()})

    except Exception as e:
        print("Error occurred during prediction:")
        traceback.print_exc()  # This prints the full error traceback
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001)
