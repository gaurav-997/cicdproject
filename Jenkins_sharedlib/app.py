# for memory and CPU monitoring in python we need a module "psutil" 
import psutil
from flask import Flask
app = Flask(__name__)

# set the path where we want to run our application "/" means it will run as root user
@app.route("/")
def index():
    cpu_percent = psutil.cpu_percent()
    mem_percent = psutil.virtual_memory().percent
    Message = None
    if cpu_percent > 80 or mem_percent >80:
        Message = "CPU and Memory utilization is high"
    return f"CPU UTILIZATION :{cpu_percent} and MEMORY UTILIZATION : {mem_percent}"

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')