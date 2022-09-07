# Sistema de Capacitaciones OGCU

# Instalacion y despliegue

    Instalar python3.9 en ubuntu 18.04
    - sudo apt update
    - sudo apt install software-properties-common
    - sudo add-apt-repository ppa:deadsnakes/ppa
    - sudo apt update
    - sudo apt install python3.9
    Instalar el venv
    - sudo apt install python3.9-venv
    Crear el entorno virtual
    - python3.9 -m venv venv

### Configuracion
Crear archivo `.env` y añadir las variables de entorno necesarias para el correcto
funcionamiento del proyecto.
- Reemplazar por los datos correspondientes las variables marcadas con: 🔃 
    
```
DATABASE_URL='psql://user:password@host:port/database'🔃

ALLOWED_HOSTS='*'

EMAIL_BACKEND='django.core.mail.backends.smtp.EmailBackend'
EMAIL_USE_TLS=True
EMAIL_HOST='smtp-mail.outlook.com'
EMAIL_HOST_USER="correo_emisor@unasam.edu.pe"🔃
EMAIL_HOST_PASSWORD="contraseña"🔃
EMAIL_PORT=587
```

### Instalar requerimientos en virtualenv
```
- Activar el venv ubicandose dentro del proyecto: source venv/bin/activate
- pip install -r requirements/base.txt
```
### Indicaciones para sysadmin

**EJECUTAR**
```
- python manage.py migrate
- python manage.py collectstatic
```

**ARRANCAR LA APLICACIÓN**
```
- python manage.py runserver
```
### Indicaciones para Base de datos:

Ejecutar el contenido del archivo: Es recomendable usar la **consola de postgres** o un DBMS como **DBeaver**

[Archivo con las consultas de postgres](https://github.com/cpaucarc/sis_capacitaciones_ccead/files/9160647/sistema-capacitaciones-ogcu-consultas.txt)
