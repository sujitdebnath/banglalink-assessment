## Getting Started
Please make sure virtual env is activated with required packages installed.

* Step 1: Run the following command
```bash
(env) user@Kernel:~/Desktop/banglalink-assessment/Problem 1/task_b$ python app.py
 * Serving Flask app "app" (lazy loading)
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 * Debug mode: on
 * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 126-762-970
```

* Step 2: Open another terminal and run the following command
```bash
user@Kernel:~/Desktop/banglalink-assessment/Problem 1/task_b$ curl -X POST -F file=@input.txt http://0.0.0.0:5000/
{
  "result": [
    "25200", 
    "88200"
  ]
}
```

## Screenshot
![GitHub Logo](https://github.com/sujitdebnath/banglalink-assessment/blob/master/Problem%201/task_b/task_b_output.png)
