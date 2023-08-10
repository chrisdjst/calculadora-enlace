import { Controller, Get } from '@nestjs/common';
import { CalculatorService } from './calculator.service';

@Controller('calculator')
export class CalculatorController {
  constructor(private readonly calculatorService: CalculatorService) {}

  @Get('fsl')
  getHello(): string {
    return "calculator"
  }
}
