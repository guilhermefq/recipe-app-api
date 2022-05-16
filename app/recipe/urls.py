from django.urls import path, include
from rest_framework.routers import DefaultRouter

# DefaultRouter automatically generate the urls to the views

from recipe import views

router = DefaultRouter()
router.register('tags', views.TagViewSet)

app_name = 'recipe'  # For the revers can lookup for the correct urls

urlpatterns = [
    path('', include(router.urls))
]
