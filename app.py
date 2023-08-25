# app.py
from flask import Flask, request, jsonify

app = Flask(__name__)

data = []

@app.route('/items', methods=['GET'])
def get_items():
    return jsonify(data)

@app.route('/items', methods=['POST'])
def create_item():
    new_item = request.get_json()
    data.append(new_item)
    return jsonify(new_item), 201

@app.route('/items/<int:item_id>', methods=['GET'])
def get_item(item_id):
    if item_id < len(data):
        return jsonify(data[item_id])
    return "Item not found", 404

@app.route('/items/<int:item_id>', methods=['PUT'])
def update_item(item_id):
    if item_id < len(data):
        updated_item = request.get_json()
        data[item_id] = updated_item
        return jsonify(updated_item)
    return "Item not found", 404

@app.route('/items/<int:item_id>', methods=['DELETE'])
def delete_item(item_id):
    if item_id < len(data):
        deleted_item = data.pop(item_id)
        return jsonify(deleted_item)
    return "Item not found", 404

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

