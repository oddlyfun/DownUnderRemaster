
function s_fish_help(_string){
	
	switch _string
	{
		case "ES":
			return 0.7;
		break;
		
		case "S":
			return 0.8;
		break;
		
		case "MS":
			return 0.9;
		break;
		
		case "M":
			return 1;
		break;
		
		case "ML":
			return 1.1;
		break;
		
		case "L":
			return 1.2;
		break;
		
		case "EL":
			return 1.5;
		break;
		
		default:
			return 1;
	}
}