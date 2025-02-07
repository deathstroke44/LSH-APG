datasets=['imageNet:20', 'audio:20', 'notre:20', 'uqv:100', 'MNIST:20', 'trevi:20', 'cifar:20', 'ukbench:20', 'glove:20', 'sun:20', 'nuswide:20', 'random:20', 'crawl:100', 'millionSong:20', 'enron:20', 'deep:20', 'astro1m:100', 'tiny5m:100', 'bigann:100', 'gist:100', 'lastfm:100', 'movielens:20', 'netflix:100', 'nytimes:100', 'sald1m:100', 'sift:100', 'space1V:100', 'text-to-image:100', 'word2vec:100', 'yahoomusic:100']
file = open('LSH_APH_script.sh', "r")
# Read the entire content of the file
content = file.read()

final_scripts=''

for dataset in datasets:
    data=content.replace('dataset-type',dataset)
    str='run-LSH-'+dataset+'.sh'
    with open(str, "w") as f:
        f.write(data)
        final_scripts=final_scripts+'sbatch '+str+' && '
final_scripts=final_scripts+'echo 1'
print(final_scripts)