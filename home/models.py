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