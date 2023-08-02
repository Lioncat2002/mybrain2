import weaviate
import json
from dotenv import load_dotenv
import os
load_dotenv(".env")
client=weaviate.Client(
    url=os.getenv("WEAVIATE_URL"),
    auth_client_secret=weaviate.AuthApiKey(api_key=os.getenv("WEAVIATE_APIKEY")),
    additional_headers={
        "X-HuggingFace-Api-Key":os.getenv("HUGGINGFACE_APIKEY")
    }
)

classobj={
    "class":"Result",
    "vectorizer":"text2vec-huggingface",
    "moduleConfig":{
        "text2vec-huggingface":{
            "model":"sentence-transformers/all-MiniLM-L6-v2",
            "options":{
                "waitForModel":True
            }
        }
    }
}

#client.schema.create_class(classobj)

#f=open("BrowserHistory.json")
#data=json.load(f)
#f.close()
#data=data["Browser History"]
#
#with client.batch(batch_size=100) as batch:
#        for i,d in enumerate(data):
#            print("importing data: ",i+1)
#            properties={
#                "title":d["title"],
#                "url":d["url"],
#                "time":d["time_usec"]
#            }
#            client.batch.add_data_object(
#                properties,
#                "Result"
#            )

nearText={"concepts":["companies"]}


response=(
    client.query.get("Result",["title","url","time"]).with_near_text(nearText).with_limit(5).do()
)

print(json.dumps(response,indent=4))