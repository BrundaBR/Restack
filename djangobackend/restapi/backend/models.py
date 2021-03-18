from django.db import models

# Create your models here.
class Signup(models.Model):
    email=models.EmailField()
    username=models.TextField(max_length=30,unique=True)
    password=models.TextField(max_length=20)

class Post(models.Model):
    post_id=models.AutoField(primary_key=True)
    username=models.TextField(max_length=30)
    product_image=models.ImageField()
    product_name=models.TextField(max_length=30)
    product_name=models.TextField(max_length=30)
    product_description=models.TextField(max_length=30)
    timeline_from_date=models.DateField(default=None)
    timeline_to_date=models.DateField(default=None)
