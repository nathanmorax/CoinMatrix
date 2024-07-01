# CointMatrix

Arquitectura MVVM

- Separación de responsabilidades en sus capas(modulos)
- Mejor organización de código, MVVM es particularmente adecuado para SwiftUI, ya que SwiftUI está diseñado para funcionar bien con datos reactivos. Los @Published properties en los ViewModels permiten que las vistas se actualicen automáticamente cuando los datos cambian, aprovechando al máximo las capacidades reactivas de SwiftUI
- Mantebilidad, la separación de responsabilidades permite que los cambios en una parte de la aplicación (por ejemplo, la lógica de negocio) no afecten directamente a otras partes (por ejemplo, la interfaz de usuario). Esto hace que el código sea más fácil de mantener y actualizar.

Patron de diseño(Singleton)

- Especialmente para la gestión de datos a través de DataController, proporciona una manera eficiente y consistente de acceder y manipular los datos compartidos a lo largo de la aplicación. Esto no solo simplifica la coordinación entre los diferentes componentes, sino que también asegura la integridad y coherencia de los datos, mejorando la eficiencia y la simplicidad del diseño de tu aplicación

Persistencia de Datos(Core Data)

- Está optimizado para manejar grandes conjuntos de datos con un rendimiento eficiente. Puede manejar consultas complejas y almacenar grandes cantidades de datos sin sacrificar el rendimiento
- No solo se encarga de la persistencia de datos, sino también de la gestión de los objetos en memoria
- El DataController es responsable de inicializar el contenedor de Core Data y proporcionar métodos para interactuar con la base de datos.
- Se crea una instancia del contenedor de Core Data (NSPersistentContainer) y se carga el almacén persistente.
- fetchCryptos(): Recupera todas las criptomonedas almacenadas en Core Data
- deleteAllCryptos(): Elimina todas las criptomonedas del almacén
- addCrypto(from:): Agrega una nueva criptomoneda al almacén
- En el ViewModel, CoinMatrixViewModel, se implementan métodos para gestionar cuándo y cómo se deben actualizar los datos desde Core Data o desde la API.

Consumo de Servicio(Aync Await)

- El uso de async y await facilita el manejo de operaciones asíncronas, como las solicitudes de red, sin bloquear el hilo principal.
- Facilitando el manejo de errores en operaciones asíncronas mediante el uso de do-catch, lo que permite un flujo de control más claro y manejable.
- Task { await fetchCryptos() } en el inicializador se asegura de que la operación de fetch de criptomonedas se ejecute de manera asíncrona inmediatamente después de que el ViewModel se inicialice, sin bloquear el hilo principal.
- fetchCryptos(): Este método comprueba la última vez que se realizó una fetch y decide si debe obtener los datos de Core Data o hacer una solicitud a la API.
- fetchData(): Realiza una solicitud de red utilizando Async Await, los datos se decodifican y se actualiza tanto la propiedad cryptoData del ViewModel como la base de datos de Core Data.


![iPhone 15 Plus](https://github.com/nathanmorax/CoinMatrix/assets/104747322/8229f11e-a857-4c81-8335-475d39d32969)

![iPhone SE 3](https://github.com/nathanmorax/CoinMatrix/assets/104747322/e901a741-e4cc-4f2d-96c2-a53a70e53427)










