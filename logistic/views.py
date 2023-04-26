from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet

from logistic.models import Product, Stock
from logistic.serializers import ProductSerializer, StockSerializer


class ProductViewSet(ModelViewSet):
    queryset = Product.objects.get_queryset().order_by('id')
    serializer_class = ProductSerializer
    search_fields = ['title', 'description']


class StockViewSet(ModelViewSet):
    queryset = Stock.objects.get_queryset().order_by('id')
    serializer_class = StockSerializer
    search_fields = ['products__title', 'products__description']


@api_view(['GET'])
def sample_view(request):
    return Response({"message": "Test cicd"})
