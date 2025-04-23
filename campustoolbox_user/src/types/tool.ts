export interface Tool {
  id: number
  icon: string
  name: string
  title: string
  description: string
  link: string
  url: string
  category: string
  isFree?: boolean
  createTime?: string
  updateTime?: string
}

export interface ToolCategory {
  id: string
  name: string
  tools: Tool[]
} 