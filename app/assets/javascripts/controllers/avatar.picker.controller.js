function AvatarPickerController($scope, $element){

	$scope.init = function(){
		$scope.selectedImgUrl = getCurrentSelectedRadioElem().val();
	};

	$scope.choose = function(){
		$scope.selectedRadioElem = getCurrentSelectedRadioElem();
		$scope.selectedImgUrl = $scope.currentImgUrl;
	};

	$scope.select = function(){
		setSelectedStyleOn();
	};

	$scope.cancel = function(){
		if (!!$scope.selectedImgUrl){
			setSelectedStyleOn($scope.selectedRadioElem);
		} else {
			clear();
		}
	};

	function getCurrentSelectedRadioElem() {
		return $element.find('[type="radio"]:checked');
	}

	function setSelectedStyleOn(elem) {
		$element.find('.avatar-list > li').removeClass('selected');

		var checkedRadio = $(elem || getCurrentSelectedRadioElem());
		checkedRadio.parents('.avatar-item').addClass('selected');
		checkedRadio.get(0).checked = true;
	}

	function clear() {
		$element.find('.avatar-list > li').removeClass('selected');
		var checkedRadioElem = getCurrentSelectedRadioElem().get(0);
		if(checkedRadioElem) {
			checkedRadioElem.checked = false;
		}
	}
}