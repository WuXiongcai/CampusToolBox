package com.example.util;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class ExcelUtil {

    /**
     * 生成Excel文件
     * @param data 数据列表
     * @param headers 表头映射 (字段名 -> 表头名)
     * @param sheetName 工作表名称
     * @return Excel文件字节数组
     */
    public static <T> byte[] createExcel(List<T> data, Map<String, String> headers, String sheetName) throws IOException {
        Workbook workbook = null;
        ByteArrayOutputStream outputStream = null;
        
        try {
            workbook = new XSSFWorkbook();
            Sheet sheet = workbook.createSheet(sheetName);
            
            // 创建表头样式
            CellStyle headerStyle = workbook.createCellStyle();
            headerStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
            headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
            Font headerFont = workbook.createFont();
            headerFont.setBold(true);
            headerStyle.setFont(headerFont);
            
            // 创建日期样式
            CellStyle dateStyle = workbook.createCellStyle();
            CreationHelper createHelper = workbook.getCreationHelper();
            dateStyle.setDataFormat(createHelper.createDataFormat().getFormat("yyyy-MM-dd HH:mm:ss"));
            
            // 创建表头行
            Row headerRow = sheet.createRow(0);
            int colIndex = 0;
            for (Map.Entry<String, String> entry : headers.entrySet()) {
                Cell cell = headerRow.createCell(colIndex++);
                cell.setCellValue(entry.getValue());
                cell.setCellStyle(headerStyle);
            }
            
            // 填充数据 - 使用反射获取字段值
            if (data != null && !data.isEmpty()) {
                Class<?> clazz = data.get(0).getClass();
                
                int rowIndex = 1;
                for (T item : data) {
                    Row row = sheet.createRow(rowIndex++);
                    colIndex = 0;
                    
                    for (String fieldName : headers.keySet()) {
                        Cell cell = row.createCell(colIndex++);
                        try {
                            Field field = getField(clazz, fieldName);
                            if (field != null) {
                                field.setAccessible(true);
                                Object value = field.get(item);
                                
                                if (value != null) {
                                    if (value instanceof Date) {
                                        cell.setCellValue((Date) value);
                                        cell.setCellStyle(dateStyle);
                                    } else if (value instanceof Number) {
                                        cell.setCellValue(Double.parseDouble(value.toString()));
                                    } else {
                                        cell.setCellValue(value.toString());
                                    }
                                }
                            }
                        } catch (Exception e) {
                            System.err.println("Error getting field value: " + e.getMessage());
                            cell.setCellValue("");
                        }
                    }
                }
            }
            
            // 自动调整列宽
            for (int i = 0; i < headers.size(); i++) {
                sheet.autoSizeColumn(i);
            }
            
            // 写入字节数组
            outputStream = new ByteArrayOutputStream();
            workbook.write(outputStream);
            return outputStream.toByteArray();
        } finally {
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (workbook != null) {
                try {
                    workbook.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    
    /**
     * 获取类的字段（包括父类字段）
     */
    private static Field getField(Class<?> clazz, String fieldName) {
        try {
            return clazz.getDeclaredField(fieldName);
        } catch (NoSuchFieldException e) {
            Class<?> superClass = clazz.getSuperclass();
            if (superClass != null && !superClass.equals(Object.class)) {
                return getField(superClass, fieldName);
            }
        }
        return null;
    }
} 