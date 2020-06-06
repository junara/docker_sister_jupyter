# docker_sister_jupyter
Setting for jupyter with sister nlp library using docker-compose.

Cache `~/.sister` cache data into `cache` directory to save model data for later using.

## Install Docker
* Install Docker desktop
    * https://docs.docker.com/compose/install/

* Set up resources of memory
    * Open Docker preferences -> Resources
    * Set >= 6.00 GB to Memory. (It is needed for Japanese language NLP with sister)
      ![image](https://user-images.githubusercontent.com/17272426/83956253-e17f5280-a896-11ea-92b5-e798b224a56d.png)
      
## Start up Docker container

* Execute following command lines.
  
```shell script
docker-compose build

docker-compose up -d
```

## Basic Usage

* Access Jupyter notebook.
    * http://localhost:8888/?token=jupyter
      ![image](https://user-images.githubusercontent.com/17272426/83956268-1ab7c280-a897-11ea-931e-af422bf3408f.png)


* For English ( http://localhost:8888/notebooks/work/SampleEnglish.ipynb )
    * Execute following command. ( ref. https://pypi.org/project/sister/ )
      ![image](https://user-images.githubusercontent.com/17272426/83956283-52266f00-a897-11ea-8ab8-f7cb9042da44.png)

      ```python
      import sister
      
      sentence_embedding = sister.MeanEmbedding(lang="en") # Need long time to download data at first time.
      
      sentence = "I am a rabbit."
      vector = sentence_embedding(sentence)
      
      print(vector)
      ```

* For Japanese ( http://localhost:8888/notebooks/work/SampleJapanese.ipynb )
    * Execute following command. ( ref. https://pypi.org/project/sister/ )
      ![image](https://user-images.githubusercontent.com/17272426/83956299-708c6a80-a897-11ea-96ff-cb3fd5259e5b.png)

    
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
