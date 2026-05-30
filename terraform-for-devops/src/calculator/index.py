import json

def lambda_handler(event, context):
    """Simple calculator Lambda function"""
    
    try:
        operation = event.get("operation")
        a = float(event.get("a", 0))
        b = float(event.get("b", 0))

        if operation == "add":
            result = a + b
        elif operation == "subtract":
            result = a - b
        elif operation == "multiply":
            result = a * b
        elif operation == "divide":
            if b == 0:
                raise ValueError("Cannot divide by zero")
            result = a / b
        else:
            raise ValueError(f"Unknown operation: {operation}")

        return {
            "statusCode": 200,
            "body": json.dumps({
                "operation": operation,
                "a": a,
                "b": b,
                "result": result
            })
        }

    except Exception as e:
        return {
            "statusCode": 400,
            "body": json.dumps({"error": str(e)})
        }