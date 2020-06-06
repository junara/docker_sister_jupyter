# docker_sister_jupyter
Setting for jupyter with sister nlp library using docker-compose.
Cache `~/.sister` cache data into `cache` directory to save model data for later using.

## Install Docker
* Install Docker desktop
    * https://docs.docker.com/compose/install/

* Set up resources of memory
    * Open Docker preferences -> Resources
    * Set >= 6.00 GB to Memory. (It is needed for Japanese language NLP with sister)

## Start up Docker container

* Execute following command lines.
  
```shell script
docker-compose build

docker-compose up -d
```

## Basic Usage

* Access Jupyter notebook.
    * http://localhost:8888/?token=jupyter

* For English ( http://localhost:8888/notebooks/work/SampleEnglish.ipynb )
    * Execute following command. ( ref. https://pypi.org/project/sister/ )
    
    
```python
import sister

sentence_embedding = sister.MeanEmbedding(lang="en") # Need long time to download data at first time.

sentence = "I am a rabbit."
vector = sentence_embedding(sentence)

print(vector)
```

* For Japanese ( http://localhost:8888/notebooks/work/SampleJapanese.ipynb )
    * Execute following command. ( ref. https://pypi.org/project/sister/ )
    
```python
import sister

sentence_embedding = sister.MeanEmbedding(lang="ja") # Need long time to download data at first time.

sentence = "私はうさぎです。"
vector = sentence_embedding(sentence)

print(vector)
```

## Quit this container.

Execute following command.

```
docker-compose down
```

## Trouble shootings

* Quit in ``sister.MeanEmbedding(lang="ja")`` 
    * Memory shortage.
        * Restart the kernel from jupyter notebook GUI.
        * Check your docker memory. See `Install Docker`