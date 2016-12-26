(function (angular) {
    function productController($scope, $http, $log,$window) {
        $scope.sirala = function (orderByKey) {
            $scope.orderBy = orderByKey;
        }
        $scope.orderBy = "+Id";
        $scope.islem = 1;
        $scope.getProducts = function () {
            $http.get("/api/Product/").success(function (data) {
                $scope.products = data;
                $log.info("Data alındı.");
            }).error(function (e) {
                $log.info(e);
            });
        }
        $scope.getProducts();
        $scope.sil = function sil(id) {
            $log.info("sil.");
            deleteProduct = $window.confirm("Ürünü silmek istediğinize emin misiniz?");
            if (deleteProduct) {
                $http.delete("/api/Product/" + id).success(function (data) {
                    $scope.msj = data ? "İşlem Başarılı" : "İşlem Başarısız";
                    $scope.getProducts();
                }).error(function (e) {
                    $log.info(e);
                });
            }
        }
        $scope.update = function update(id) {
            $http.get("/api/Product/"+id).success(function (data) {
                $scope.name = data.Name;
                $scope.id = data.Id;
                $scope.price = data.Price;
                $scope.islem = 2;
                $log.info(data);
            }).error(function (e) {
                $log.info(e);
            });
        }
        $scope.save = function () {
            if ($scope.name || $scope.price) {
                if ($scope.islem == 1) {
                    $http.post("/api/Product/", { 'Name': $scope.name, 'Price': $scope.price }).success(function (data) {
                        $scope.msj = data ? "İşlem Başarılı" : "İşlem Başarısız";
                        if (data) {
                            $scope.islem = 1;
                            $scope.name = "";
                            $scope.id = 0;
                            $scope.price = "";
                            $scope.getProducts();
                        }
                       
                    }).error(function (e) {
                        $log.info(e);
                    });
                } else if ($scope.islem == 2) {
                    $log.info("güncellleme");
                    $http.put("/api/Product/" + $scope.id, { 'Id': $scope.id, 'Name': $scope.name, 'Price': $scope.price }).success(function (data) {
                        $scope.msj = data ? "İşlem Başarılı" : "İşlem Başarısız";
                        if (data) {
                            $scope.islem = 2;
                            $scope.name = "";
                            $scope.id = 0;
                            $scope.price = "";
                            $scope.getProducts();
                        }
                    }).error(function (e) {
                        $log.info(e);
                    });
                }
            } else {
                $scope.msj = "Tüm Alanları Doldurun!!";
            }
        }
    }

    var app = angular.module("crudApp", []);
    app.controller("product", ["$scope", "$http", "$log", "$window", productController]);
})(angular);
