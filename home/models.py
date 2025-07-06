from django.db import models

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
class VistaInventarioCompleto(models.Model):
    id_local = models.CharField(max_length=20, primary_key=True, db_column='Id_Local')
    nombre_local = models.CharField(max_length=100, db_column='nombre_local')
    ubicacion = models.CharField(max_length=100, db_column='Ubicacion')
    isbn = models.CharField(max_length=20, db_column='ISBN')
    titulo = models.CharField(max_length=100, db_column='Titulo')
    autor = models.CharField(max_length=100, db_column='Autor')
    cantidad_disponible = models.IntegerField(db_column='Cantidad_disponible')
    costo = models.DecimalField(max_digits=10, decimal_places=2, db_column='Costo')

    class Meta:
        managed = False
        db_table = 'vista_inventario_completo'
        unique_together = ('id_local', 'isbn')

    def __str__(self):
        return f"{self.titulo} ({self.isbn}) en {self.nombre_local}"
