from django.db import models
from django.conf import settings

class Libro(models.Model):
    isbn = models.CharField(max_length=20, primary_key=True)
    titulo = models.CharField(max_length=100)
    autor = models.CharField(max_length=100)
    editorial = models.CharField(max_length=100)
    genero = models.CharField(max_length=50)
    descripcion = models.TextField(blank=True, null=True)  # ← Campo nuevo para texto largo
    urlpdf = models.CharField(max_length=255)
    portadaurl = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        db_table = 'libro'

    def __str__(self):
        return self.titulo
    
class Local(models.Model):
    id_local = models.CharField(max_length=20, primary_key=True, db_column='Id_Local')
    ubicacion = models.CharField(max_length=100, db_column='Ubicacion')

    class Meta:
        db_table = 'local'
        managed = False

    def __str__(self):
        return self.ubicacion

class Inventario(models.Model):
    id_local = models.ForeignKey(Local, on_delete=models.CASCADE, db_column='Id_Local')
    libro = models.ForeignKey(Libro, on_delete=models.CASCADE, db_column='ISBN')
    cantidad_disponible = models.IntegerField(db_column='Cantidad_disponible')
    costo = models.DecimalField(max_digits=10, decimal_places=2, db_column='Costo')

    class Meta:
        db_table = 'inventario'
        unique_together = (('id_local', 'libro'),)

class LibroGuardado(models.Model):
    usuario = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    libro = models.ForeignKey(Libro, on_delete=models.CASCADE)
    fecha_guardado = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = ('usuario', 'libro')

    def __str__(self):
        return f"{self.usuario} - {self.libro}"