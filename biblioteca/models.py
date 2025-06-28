# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AccountsCustomuser(models.Model):
    id = models.BigAutoField(primary_key=True)
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()
    phone = models.CharField(max_length=15, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'accounts_customuser'


class AccountsCustomuserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    customuser = models.ForeignKey(AccountsCustomuser, models.DO_NOTHING)
    group = models.ForeignKey('AuthGroup', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'accounts_customuser_groups'
        unique_together = (('customuser', 'group'),)


class AccountsCustomuserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    customuser = models.ForeignKey(AccountsCustomuser, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'accounts_customuser_user_permissions'
        unique_together = (('customuser', 'permission'),)


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class BibliotecaLibro(models.Model):
    id = models.BigAutoField(primary_key=True)
    titulo = models.CharField(max_length=200)
    autor = models.CharField(max_length=100)
    editorial = models.CharField(max_length=100)
    fecha_publicacion = models.DateField()
    isbn = models.CharField(unique=True, max_length=13)
    paginas = models.IntegerField()
    disponible = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'biblioteca_libro'


class Compra(models.Model):
    id_compra = models.IntegerField(db_column='Id_Compra', primary_key=True)  # Field name made lowercase.
    fecha_decompra = models.DateField(db_column='Fecha_deCompra', blank=True, null=True)  # Field name made lowercase.
    nom_usuario = models.ForeignKey('Usuario', models.DO_NOTHING, db_column='Nom_Usuario', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'compra'


class Detallecompra(models.Model):
    id_compra = models.ForeignKey('Compra', models.DO_NOTHING, db_column='Id_Compra')
    isbn = models.ForeignKey('Libro', models.DO_NOTHING, db_column='ISBN')
    cantidad = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'detallecompra'
        unique_together = (('id_compra', 'isbn'),)



class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AccountsCustomuser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Inventario(models.Model):
    id_local = models.ForeignKey('Local', models.DO_NOTHING, db_column='Id_Local')
    isbn = models.ForeignKey('Libro', models.DO_NOTHING, db_column='ISBN')
    cantidad_disponible = models.IntegerField()
    costo = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        managed = False
        db_table = 'inventario'
        unique_together = (('id_local', 'isbn'),)



class Libro(models.Model):
    isbn = models.CharField(db_column='ISBN', primary_key=True, max_length=20)  # Field name made lowercase.
    titulo = models.CharField(db_column='Titulo', max_length=100, blank=True, null=True)  # Field name made lowercase.
    autor = models.CharField(db_column='Autor', max_length=100, blank=True, null=True)  # Field name made lowercase.
    editorial = models.CharField(db_column='Editorial', max_length=100, blank=True, null=True)  # Field name made lowercase.
    genero = models.CharField(db_column='Genero', max_length=50, blank=True, null=True)  # Field name made lowercase.
    urlpdf = models.CharField(db_column='UrlPDF', max_length=255, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'libro'


class Local(models.Model):
    id_local = models.CharField(db_column='Id_Local', primary_key=True, max_length=20)  # Field name made lowercase.
    ubicacion = models.CharField(db_column='Ubicacion', max_length=100, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'local'


class Usuario(models.Model):
    nom_usuario = models.CharField(db_column='Nom_Usuario', primary_key=True, max_length=50)  # Field name made lowercase.
    nombre = models.CharField(db_column='Nombre', max_length=50, blank=True, null=True)  # Field name made lowercase.
    apellido = models.CharField(db_column='Apellido', max_length=50, blank=True, null=True)  # Field name made lowercase.
    correo_electronico = models.CharField(db_column='Correo_Electronico', max_length=100, blank=True, null=True)  # Field name made lowercase.
    contrasena = models.CharField(db_column='Contrasena', max_length=100, blank=True, null=True)  # Field name made lowercase.
    telefono = models.CharField(db_column='Telefono', max_length=20, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'usuario'
