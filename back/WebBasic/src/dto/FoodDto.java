package dto;

public class FoodDto {
    private int FoodSeq;
    private String FoodName;
    private String FoodPrice;

    public FoodDto() {
        super();
    }

	public FoodDto(int foodSeq, String foodName, String foodPrice) {
		super();
		FoodSeq = foodSeq;
		FoodName = foodName;
		FoodPrice = foodPrice;
	}

	public int getFoodSeq() {
		return FoodSeq;
	}

	public void setFoodSeq(int foodSeq) {
		FoodSeq = foodSeq;
	}

	public String getFoodName() {
		return FoodName;
	}

	public void setFoodName(String foodName) {
		FoodName = foodName;
	}

	public String getFoodPrice() {
		return FoodPrice;
	}

	public void setFoodPrice(String foodPrice) {
		FoodPrice = foodPrice;
	}

 
}