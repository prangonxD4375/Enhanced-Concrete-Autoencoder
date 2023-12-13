# Custom Cost Function for Concrete Autoencoder


The custom cost function in the Concrete Autoencoder enhances the feature selection process by introducing a positive feature interaction term (
C+ ) that identifies and rewards duplicate or correlated features. Complementing this, an exponential regularization term (C+ loss) with a temperature
parameter ensures a balanced influence, preventing overfitting and guiding the model to dynamically adapt the importance of features during training.
This approach facilitates the selection of a subset of the most relevant features, contributing to improved model performance across diverse scenarios and applications.

This README file provides instructions on how to integrate and use a custom cost function with the Concrete Autoencoder. The custom cost function has been added to enhance the functionality of the original Concrete Autoencoder project by [mfbalin](https://github.com/mfbalin/Concrete-Autoencoders).

## Installation

To use the custom cost function, follow these steps:

1. Install the Concrete Autoencoder package using pip:

   ```bash
   pip install concrete-autoencoder

Replace the _init_.py file in your local Python installation directory with the one from the original Concrete Autoencoder project. The original file can be found at Python(version)\Lib\site-packages\concrete_autoencoder.

## Usage

```python
from concrete_autoencoder import ConcreteAutoencoderFeatureSelector
from keras.datasets import mnist
from keras.utils import to_categorical
from keras.layers import Dense, Dropout, LeakyReLU
import numpy as np

# Load MNIST data
(x_train, y_train), (x_test, y_test) = mnist.load_data()
x_train = np.reshape(x_train, (len(x_train), -1))
x_test = np.reshape(x_test, (len(x_test), -1))
y_train = to_categorical(y_train)
y_test = to_categorical(y_test)
print(x_train.shape, y_train.shape)
print(x_test.shape, y_test.shape)

def decoder(x):
    x = Dense(320)(x)
    x = LeakyReLU(0.2)(x)
    x = Dropout(0.1)(x)
    x = Dense(320)(x)
    x = LeakyReLU(0.2)(x)
    x = Dropout(0.1)(x)
    x = Dense(784)(x)
    return x

selector = ConcreteAutoencoderFeatureSelector(K=20, output_function=decoder, num_epochs=800)

selector.fit(x_train, x_train, x_test, x_test)

```

For further details, check the [original Concrete Autoencoder project](https://github.com/mfbalin/Concrete-Autoencoders).


Feel free to explore and experiment with the provided code for your specific use case. If you encounter any issues or have questions, refer to the original project page for further details and discussions.
