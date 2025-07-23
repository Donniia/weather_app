# import numpy as np
# from sklearn.ensemble import RandomForestClassifier
# from sklearn.model_selection import train_test_split
# import pickle
#
# # Generate dummy data with 5 features
# X = np.random.randint(0, 2, size=(100, 5))  # 100 samples, 5 binary features
# y = np.random.randint(0, 2, size=(100,))    # Binary classification (0 or 1)
#
# # Split and train
# X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
# model = RandomForestClassifier()
# model.fit(X_train, y_train)
#
# # Save model
# with open("random_forest_model.pkl", "wb") as f:
#     pickle.dump(model, f)
#
