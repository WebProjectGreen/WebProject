package com.project.catdog.DTO;

public class ProductCountDTO {
	private int total;
	private int fashion;
	private int walk;
	private int food;
	private int cat;
	private int dog;
	
	public ProductCountDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductCountDTO(int total, int fashion, int walk, int food, int cat, int dog) {
		super();
		this.total = total;
		this.fashion = fashion;
		this.walk = walk;
		this.food = food;
		this.cat = cat;
		this.dog = dog;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getFashion() {
		return fashion;
	}

	public void setFashion(int fashion) {
		this.fashion = fashion;
	}

	public int getWalk() {
		return walk;
	}

	public void setWalk(int walk) {
		this.walk = walk;
	}

	public int getFood() {
		return food;
	}

	public void setFood(int food) {
		this.food = food;
	}

	public int getCat() {
		return cat;
	}

	public void setCat(int cat) {
		this.cat = cat;
	}

	public int getDog() {
		return dog;
	}

	public void setDog(int dog) {
		this.dog = dog;
	}
	

}