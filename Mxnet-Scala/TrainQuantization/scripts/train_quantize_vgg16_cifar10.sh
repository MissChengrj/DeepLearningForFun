ROOT=$(cd "$(dirname $0)/.."; pwd)

# put yur mxnet jar file in the lib folder
MXNET_JAR_FILE=$ROOT/lib/mxnet-full_2.11-INTERNAL.jar

CLASS_PATH=$MXNET_JAR_FILE:$ROOT/target/scala-2.11/classes/:\
$HOME/.ivy2/cache/org.scala-lang/scala-library/jars/scala-library-2.11.8.jar:\
$HOME/.ivy2/cache/args4j/args4j/bundles/args4j-2.33.jar:\
$HOME/.ivy2/cache/org.slf4j/slf4j-api/jars/slf4j-api-1.6.2.jar:\
$HOME/.ivy2/cache/org.slf4j/slf4j-simple/jars/slf4j-simple-1.6.2.jar

DATA_PATH="${ROOT}/data"
BATCH_SIZE=128
FINETUNE_MODEL_EPOCH=46
FINETUNE_MODEL_PREFIX=$ROOT/models/cifar10_vgg16_acc_0.8772035
SAVE_MODEL_PATH=$ROOT/models/cifar10_quantize_vgg16
GPU=0
LR=0.001
TRAIN_EPOCH=100000

java -Xmx4G -cp $CLASS_PATH \
	TrainQuanVGG \
	--batch-size $BATCH_SIZE \
	--data-path $DATA_PATH/cifar \
	--finetune-model-epoch $FINETUNE_MODEL_EPOCH \
	--finetune-model-prefix $FINETUNE_MODEL_PREFIX \
	--save-model-path $SAVE_MODEL_PATH \
	--gpu $GPU \
	--lr $LR \
	--train-epoch $TRAIN_EPOCH
