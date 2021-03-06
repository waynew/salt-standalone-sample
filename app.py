import responder

api = responder.API()

@api.route("/")
async def main(req, resp):
    resp.text = "Hey, it works! Maybe try /api/hello too?"

@api.route("/api/{greets}")
async def greet_world(req, resp, *, greets):
    resp.text = f"{greets}, world! Salt is the coolest!"

if __name__ == '__main__':
    api.run(address='0.0.0.0', port=5042)
