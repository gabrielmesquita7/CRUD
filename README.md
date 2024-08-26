# CRUD

## Passo a Passo: Integrando Firebase ao Flutter (Exemplo inicial somente para o método CREATE)

### 1. Logar com a conta Google no Firebase e criar um novo projeto
- Acesse [Firebase Console](https://console.firebase.google.com/).
- Faça login com sua conta Google.
- Crie um novo projeto no Firebase.

### 2. Conectar o Firebase com o Flutter

#### 2.1 Instalar Firebase CLI
```bash
sudo npm install -g firebase-tools
```
#### 2.2 Fazer login no Firebase
```bash
firebase login
```
- Você será redirecionado para uma página onde deverá selecionar o e-mail Google que utilizou para criar o projeto.

#### Ativar o FlutterFire CLI
```bash
flutter pub global activate flutterfire_cli
```
- Se for notificado com um erro, copie e cole o seguinte comando para resolver:
```bash
export PATH="$PATH":"$HOME/.pub-cache/bin"
```
#### Configurar Firebase no projeto Flutter
```bash
flutterfire configure
```
- Serão mostrados todos os projetos vinculados à conta Google. Selecione o projeto que você criou e as plataformas que terão suporte (Android, iOS, etc.).

#### 2.5 Adicionar Firebase Core ao projeto
```bash
flutter pub add firebase_core
```
#### 2.6 Inicializar Firebase no *main.dart*
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // ...
  runApp(const MainApp());
}
```
### 3. Configurar o Firestore no Firebase
- No Firebase Console, a primeira coisa a ser feita é criar um Firestore Database.
- Não altere nenhuma configuração e finalize a criação.
- Depois, vá até a aba de Regras e altere o código de:

```plaintext
allow read, write: if false;
```
para:

```plaintext
allow read, write: if true;
```
- Clique em Publicar.

#### 3.1 Adicionar o Firestore ao projeto
```bash
flutter pub add cloud_firestore
```
### 4. Criar a Estrutura de Pastas e Arquivos
#### 4.1 Estrutura do Projeto
```plaintext
lib/
├── pages/
│   └── home_page.dart
└── services/
    └── firestore.dart
```
#### 4.2 Código em *main.dart*

![image](https://github.com/user-attachments/assets/a45f5ae9-5c9e-4027-8609-edab9903047a)


#### 4.3 Código em *home_page.dart*

![image](https://github.com/user-attachments/assets/942a387e-6347-4325-9026-97176a31da72)


#### 4.4 Código em *firestore.dart*

![image](https://github.com/user-attachments/assets/65be7b5b-88f1-48ac-9452-c2772f4f48d0)


## Observação:

- Na hora de executar o projeto, não execute no Linux, pois não terá suporte. Use o navegador web.
