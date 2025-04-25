# E-commerce Database Design

A comprehensive MySQL database schema tailored for an e-commerce platform.  
Built as a peer group project, this design reflects real-world products, local brands, and pricing.

---

## 📦 Project Overview

This repository includes:

- ✅ A well-structured schema of 12 relational tables with integrity constraints  
- 🇰🇪 Sample data featuring Kenyan products and brands  
- 🔗 A detailed ERD to visualize relationships between tables  

---

## 🗂️ Repository Contents

- `ecommerce.sql` – SQL script to create and populate the database  
- `Ecommerce DB.pdf` – Entity-Relationship Diagram showing database structure  

---

## 🧱 Database Schema Highlights

| Table Name           | Description                                                   |
|----------------------|---------------------------------------------------------------|
| `product_image`      | Stores image URLs for product items                           |
| `color`              | Available product colors (e.g., Red, Blue)                    |
| `product_category`   | Groups products by category (e.g., Clothing, Electronics)     |
| `product`            | General product details (e.g., "Men’s T-Shirt")               |
| `product_item`       | Product variations (e.g., Red T-Shirt, Size M)                |
| `brand`              | Kenyan and regional brand names                               |
| `product_variation`  | Links product items to sizes and colors                       |
| `size_category`      | Groups of size types (e.g., Clothing, Screens)                |
| `size_option`        | Specific size values (e.g., M, 43-Inch)                        |
| `product_attribute`  | Extra features (e.g., Material: Cotton, Resolution: 4K)        |
| `attribute_category` | Groups of attributes (e.g., Physical, Technical)              |
| `attribute_type`     | Describes attribute names (e.g., Material, Screen Size)       |

See `erd.png` for a visual breakdown of these relationships.

---

## 🛒 Sample Data

Local relevance is reflected through sample data such as:

- **Clothing**: Men’s T-Shirt – KES 1,500 (Mara Moja)  
- **Smartphones**: Safaricom Android Phone – KES 10,000  
- **Vehicles**: Isuzu D-Max – KES 4.5M  
- **Furniture**: Sofa Set – KES 65,000 (Victoria Furniture)  
- **Personal Care**: Lifebuoy Soap – KES 100 (Unilever Kenya)  
- **Beverages**: Tusker Lager – KES 150 (EABL)  
- **Electronics**: LG LED TV – KES 35,000  

---

## 🧰 Tools Used

- **MySQL Workbench** – Schema design and testing  
- **dbdiagram.io** – For ERD creation  
- **GitHub** – Collaboration and version control  

---

## 👥 Group Collaboration

This was a collaborative group assignment with contributions in:

- 🧩 Designing and mapping the ERD  
- 🛠 Writing and testing the SQL schema  
- 🇰🇪 Populating the database with Kenyan-relevant data  
- 📘 Documenting and managing the GitHub repository  

**Communication & Workflow:**

- GitHub – Pull requests and issue tracking  
- WhatsApp – Day-to-day updates  
- Weekly meetings – Progress reviews and task coordination  

---

## 📄 License

This project is provided for **educational purposes only** and is **not licensed for commercial use**.

---

